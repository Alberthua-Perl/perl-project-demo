#!/usr/Bin/perl -w
use strict;
use Encode;
use URI::Escape;
use HTTP::Request;
use HTTP::Cookies;
use LWP::UserAgent;
use HTML::Parser;

my $cookie_jar  = HTTP::Cookies->new(
file        => "./acookies.lwp",
autosave    => 1,
);
my $url = "http://oms.novogene.cn/novotest/action.sys?cmd=loginManager&docmd=checkLogin";
my $ua = LWP::UserAgent->new( );
my $cookies = $ua->cookie_jar($cookie_jar);
$ua->agent('Mozilla/5.0 [en] (Centos; Linux)');
my $res = $ua->post( "$url",[accountName =>"chenhuifang", password =>"chf12345678",],);
if($res->is_success){
    print "login success!\n";
}else{
    print "login failed!\n";exit;
}
sleep 1;

my $type_ref = &get_type('E:\\OMS\\scripts\\type.txt');
my ($last_manager_name,$last_operate_time) = &get_last_job('E:\\OMS\\scripts\\last_record.txt');
$res = $ua->post("http://oms.novogene.cn/novotest/webinfo/openmain/form/sqlservlet.W?cmd=workflow_obj&docmd=desktask_list_5_3&ITEM_ID=9bcf8d02-189a-4be8-9b0a-e39565517435&WMAIN_ID=3a32cdc5-09c5-4465-b860-327d4c3b06a5&PPOINT_ID=77fe15a1-66af-42b1-bb76-b11d79dae52f&excelflag=undefined",[page=>'1',rp=>'500',],);
unless ($res->is_success){print "failed!\n";exit;}
my $all_jobs = $res->content();
$all_jobs=~s/^.*,"rows":\[\{//;
my @temp = split(/\},\{/,$all_jobs);

open my $out,">","E:\\OMS\\DNA-lib\\DNA建库项目.xls";
print $out "下单日期\t项目编号\t项目名称\t运营经理\t文库类型\t插入大小\t样本数\t操作人\t测序策略\t数据量\t截止时间\t备注\t文库名称\tIndex\n";
my ($n, $mark_name, $mark_time);
$n=0;
my %project;
foreach(@temp){
    my @patterns = $_ =~/span class='blue hand' onClick=viewsTaks\('(.*)','(.*)','(.*)','(.*)','(.*)','-1'\)>(.*)<\/span>",(.*)/;
	(my $manager_name = (split(/,/,$patterns[6]))[4])=~s/"//g;
	(my $operate_time = (split(/,/,$patterns[6]))[-3])=~s/"//g;	

	my $tem1 = $ua->post("http://oms.novogene.cn/novotest/workflow/beir/task/taskzd_g/form/sqlservlet.W",[PPOINT_ID=>"77fe15a1-66af-42b1-bb76-b11d79dae52f",FLWUUID=>"$patterns[0]",OBJ_YW_ID=>"$patterns[1]",OBJ_YW_BFID=>"$patterns[2]",OBJ_ID=>"$patterns[3]",OBJ_BFID=>"$patterns[4]",cmd=>"Mis_Task",docmd=>"flw_get_info",],);
    unless ($tem1->is_success){print "$manager_name\t$operate_time failed!\n";next;}
	my $result_raw1 = $tem1->content();
	sleep 1;
	my ($task_id, $file_name)= $result_raw1 =~/,"ID":"(.*?)","TASK_CODE":.*"REPORT_UPLOAD":"(.*)","INFORMATION_ANALYSIS"/;
		
	my $tem2 = $ua->post("http://oms.novogene.cn/novotest/workflow/beir/task/taskzd_g/form/sqlservlet.C?cmd=Task_Mx&docmd=Tm_list",[TASK_ID=>"$task_id",],);
	unless ($tem2->is_success){print "$manager_name\t$operate_time failed!\n";next;}
    my $result_raw2 = $tem2->content();
	sleep 1;   
    my @results = map {encode('gbk',decode('utf8',$_))} &analysis($result_raw1,$result_raw2);
	$results[4]=~s/^\s//;
	if(exists $type_ref->{$results[4]}){
        ($mark_name, $mark_time) = ($manager_name,$operate_time) if ($n==0);
		last if($manager_name eq $last_manager_name and $operate_time eq $last_operate_time);
		$n++;		
        print $out join("\t",@results),"\n";
        print "$results[1]\n";
        if (exists $project{$results[2]}){
		    $results[2] = "$results[2]".'_'."$project{$results[2]}";
			$project{$results[2]}++;
		}else{
		    $project{$results[2]}++;
		}	
	    get_files($file_name, $results[2]);
	}
}
close $out;
print "Reach to the last record.\n";
&record_last('E:\\OMS\\scripts\\last_record.txt', $mark_name, $mark_time, $n);
print "All done!\n";

sub analysis{
    my ($part1,$part2) = @_;
	my @temp1 = map {$_?s/<br>/,/gr:$_}
	$part1 =~ /.*"TASK_NAME":"(.*?)",.*,"TASK_REMARK":"(.*?)",.*,"TASK_START_DATE":"(.*?)",.*,"TASK_MAN":"(.*?)",.*,"TASK_DESCRIPTION":"(.*?)",.*?,"PJ_CODE":"(.*?)",.*/;
	
	$part2 =~ /.*"total":(.*),"rows":\[\{(.*)/;
	my $sample_number = $1;
	my @temp2 = split(/\},\{/,$2);
	my @inf2;
	my @multi;
	foreach(@temp2){
	    s/"//g;
	    my @inf_temp = split(/,/,);
		my $element_num = $#inf_temp;
		foreach(0..$element_num){
		    if (exists $multi[$_]->{$inf_temp[$_]}){
			    next;
		    }else{
			    $inf2[$_] .= " $inf_temp[$_]";
				$multi[$_]->{$inf_temp[$_]}++;
		    }
		}
	}
    @inf2 = map {s/,$//r} @inf2;  
	
	return (@temp1[2,5,0,3],@inf2[8,10],$sample_number,'',$inf2[13],"$inf2[14]"." $inf2[15]",$inf2[17],"$temp1[1]"." $temp1[4]",'','');
}
sub get_files{
    my $name = shift;
	my $proj_name = shift;
	my ($postfix,) = $name =~ /.*(\..*?$)/;
	$proj_name .= $postfix;
    $name = 'd:/apache-tomcat-6.0.18_last/webapps/novotest/workflow/subs/upFile/excel/'.$name;
	my $url = uri_escape($name);

    $url = 'http://oms.novogene.cn/novotest/webinfo/basic/allToexcel/doajaxdown.jsp?filepath='."$url";
    my $test_down = $ua->get("$url");
	if ($test_down->is_success){
        open my $zip,">","E:\\OMS\\zip\\$proj_name";
        binmode $zip; 
        print $zip $test_down->content();
        close $zip;
	    sleep 1;
	}else{
	    print "$proj_name download failed!\n";
	}
}

sub get_type{
    my $file = shift;
	my %hash;
	open my $fh,"<","$file";
	while(<$fh>){
	    chomp;
        $_ = encode('gbk',decode('utf8',$_));		
		$hash{$_}++;
	}
	close $fh;
	return \%hash;	
}

sub get_last_job{
    my $file = shift;
	my %hash;
	open my $fh,"<","$file";
    my @lines = <$fh>;
	close $fh;
	chomp $lines[-1];
	my @temp = split(/,/,$lines[-1]);
	return @temp;
}

sub record_last{
    my $file = shift;
	my ($name, $time, $record_number) = @_; 
    open my $fh,">>","$file";
	if(defined $name and defined $time){
        print $fh join(",",($name, $time, $record_number));
	    print $fh "\n";
	}else{
	    print "something wrong with record_last\n";
	}
	close $fh;
}


