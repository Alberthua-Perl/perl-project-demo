### Comment:
- Following Bash and Perl scripts are used to collect positive loci:
  - CollectPositiveLoci.V1.sh
  - CollectPositiveLoci.ThrDim.V1.pl
  - MergeNameProject.pl
- working directory:
  - /public/home/liurui/hualf

### Configure:
- configure file: 
  - PositiveLoci.cfg

### Format:
- Configure file format as following, also you can type "\t" or other white space between each element
- file format like this `<SampleName>    <Project>`, `EZ17070507LNCTX    521`

### Usage:
```bash
$ vim PositiveLoci.cfg			# set configure file
$ sh CollectPositiveLoci.V1.sh	# run the script
```

### Note:
- Please only according to the notes to run, if run successfully, you can see the shinning charactors "All right." under blue backbround!

### Output directory:
- /public/home/liurui/hualf
- /public/home/liurui/hualf/LociTmp

### Median file:
- /public/home/liurui/hualf: 
  - SampleList.txt
  - MergeNameProject.txt

### Output file:
- /public/home/liurui/hualf:
  - PositiveLoci.txt: outcome file(all samples with 'Pos' element)
  - TargetGeneDrugV2.nested.hash.txt: all samples in nested hash structure used to debug
