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
my $res = $ua->post( "$url",[accountName =>"donghuan", password =>"za.za",],);
if($res->is_success){
    print "login success!\n";
}else{
    print "login failed!\n";exit;
}
sleep 1;

$res = $ua->post("http://oms.novogene.cn/novotest/webinfo/openmain/form/sqlservlet.W?cmd=workflow_obj&docmd=desktask_list_4&ITEM_ID=9bcf8d02-189a-4be8-9b0a-e39565517435&WMAIN_ID=8a10e664-af25-4126-9650-275c263ee6c2&PPOINT_ID=e2015879-023e-4841-b44d-950b8fd0fd4d&excelflag=undefined",[page=>'1',rp=>'500',],);
unless ($res->is_success){print "failed!\n";next;}
my $all_jobs = $res->content();
$all_jobs=~s/^.*,"rows":\[\{//;
my @temp = split(/\},\{/,$all_jobs);

open my $out,">","E:\\OMS amplification\\ZTD\\DNA16S项目.xls";
print $out "下单日期\t合同编号\t项目编号\t项目名称\t运营经理\t扩增类型\t样本数\t合格总数\t操作人\t截止时间\t下单备注\t报告日期\n";

foreach(@temp){
    my @patterns = $_ =~/span class='blue hand' onClick=viewsTaks\('(.*?)','(.*?)','(.*?)','(.*?)','(.*?)','1'\)>(.*)<\/span>",(.*)/;
	my $tem1 = $ua->post("http://oms.novogene.cn/novotest/workflow/subs/klims/detection_task/form/sqlservlet.W",[PPOINT_ID=>'e2015879-023e-4841-b44d-950b8fd0fd4d',FLWUUID=>"$patterns[0]",OBJ_YW_ID=>"$patterns[1]",OBJ_YW_BFID=>"$patterns[2]",OBJ_ID=>"$patterns[3]",OBJ_BFID=>"$patterns[4]",cmd=>'detection_task',docmd=>"flw_get_info",],);
    unless ($tem1->is_success){print "failed!\n";next;}
	my $result_raw1 = encode('gbk',decode('utf8',$tem1->content())); 
	sleep 1;
	
	my ($task_id,)= $result_raw1 =~/"ID":"(.*?)","TASK_TYPE":"/;
	my $tem2 = $ua->post("http://oms.novogene.cn/novotest/workflow/subs/klims/detection_task/form/sqlservlet.C?cmd=detection_task_qc&docmd=et_list",[S_ID=>"$task_id",],); 
	unless ($tem2->is_success){print "failed!\n";next;}
    my $result_raw2 = encode('gbk',decode('utf8',$tem2->content()));
	sleep 1;
	
	my $tem3 = $ua->post("http://oms.novogene.cn/novotest/webinfo/openmain/form/listhistory.jsp?PPOINT_ID=e2015879-023e-4841-b44d-950b8fd0fd4d",[OBJ_ID=>"$patterns[3]",],); 
	unless ($tem3->is_success){print "failed!\n";next;}
    my $result_raw3 = encode('gbk',decode('utf8',$tem3->content()));
	sleep 1;
	
    my @results =  &analysis($result_raw1,$result_raw2,$result_raw3);
    print $out join("\t",@results),"\n";
	print "$results[2]\n";	
}
close $out;
print "All done!\n";

sub analysis{
    my ($part1,$part2,$part3) = @_;
	my @temp1 = map {$_?s/<br>/,/gr:$_}
	$part1 =~/","PROJECT_NAME":"(.*?)","PROJECT_NUMBER":"(.*?)","CONTRACT_NUMBER":"(.*?)","PROJECT_TYPE":"(.*?)",.*","SAMPLE_REMARK":"(.*?)","START_DATE":"(.*?)","END_DATE":"(.*?)","/;	
	my($sample_number,)=$part2 =~ /.*"total":(.*),"rows":\[\{(.*)/;
	my ($manger_name,) = $part3 =~ /样品提取\+检测任务下达.*?>办结<\/font>\]<font color.*?>(.*?)\s/;	
	return (@temp1[5,2,1,0],"$manger_name",'',$sample_number,'','',@temp1[6,4],'');
}
