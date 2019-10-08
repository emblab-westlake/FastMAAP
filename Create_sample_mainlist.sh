#!bin/bash
# Author:zhangguoqing
# CTIME: 2018-1-17
# MTIME: 2018-5-09
# Version: 1.1
# Function: create mainlist file for the import
echo "sample-id,absolute-filepath,direction" > sample_mainlist.txt
for fq in *.fq.gz
do
echo "$fq,$PWD/$fq,forward" >> sample_mainlist.txt
done
sed -i 's/.fq.gz//' sample_mainlist.txt

