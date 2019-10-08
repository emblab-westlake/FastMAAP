#!/usr/bin/bash
#==========================================================
# Author:zhangguoqing
# Email:zhanguoqing84@westlake.edu.cn
# Date:2019-8-3
# Version: 1.0
# Update:2019-8-6
# Function: Import single-end & paired-end data and summarize
# Example:
# >bash Import_rawdata_guide.sh PROJECT_PATH READS_STYLE[P or S] 

#==========================================================

# Get current directory
basepath=$(cd `dirname $0`; pwd)
# check Sequencing Methods
if [ "$2" != 'P' -a "$2" != 'S' ]
then
echo "Please enter the correct Sequencing Methods[P,S]"
exitca
fi

mkdir $1/Analysis_TEMP
# create mainlist file
echo "sample-id,absolute-filepath,direction" > $1/Analysis_TEMP/sample_mainlist.txt
dos2unix $1/Project_Info/SampleInfo.csv
for fq in `cat $1/Project_Info/SampleInfo.csv |awk -F',' 'NR >1 {print $1,$2,$4}' | grep -v '\<[0]\>' | awk '{print $1}'`
do
if [ "$2" = 'S' ]
then
# The file suffix
echo ${fq},$1/Raw_Data/${fq}.fastq.gz,forward >> $1/Analysis_TEMP/sample_mainlist.txt
elif [ "$2" = 'P' ]
then
echo ${fq},$1/Raw_Data/${fq}.R1.fastq.gz,forward >> $1/Analysis_TEMP/sample_mainlist.txt
echo ${fq},$1/Raw_Data/${fq}.R2.fastq.gz,reverse >> $1/Analysis_TEMP/sample_mainlist.txt
fi

done
mkdir $1/Analysis_TEMP/Cluster_TEMP 
mkdir $1/Analysis_TEMP/closed4picrust
mkdir $1/Analysis_TEMP/alpha-diversity
mkdir $1/Analysis_TEMP/beta-diversity
mkdir $1/Analysis_TEMP/taxonomy
if [ "$2" = 'S' ]
then
echo "Import raw_data----------- `date`" > $1/Import_rawdata_log.file
#cd $1/raw_data


bash $basepath/Import_data_Single.sh $1 $2 >> $1/Import_rawdata_log.file 2>&1
fi
if [ "$2" = 'P' ]
then
echo "Import raw_data----------- `date`" > $1/Import_rawdata_log.file
#cd $1/raw_data


bash $basepath/Import_data_Paired.sh $1 $2 >> $1/Import_rawdata_log.file 2>&1
fi

ErrorError=`grep "Error" $1/Import_rawdata_log.file`
if [ -z "$ErrorError" ]
then
echo "Import raw_data----------- down" >> $1/Import_rawdata_log.file
echo "Yes"
else
echo "No"
exit
fi


