#!/usr/bin/bash
#==========================================================
# Author:zhangguoqing
# Email:zhangguoqing84@westlake.edu.cn
# Date:2019-8-5
# Version: 1.0
# Update:2019-8-6
# Qiime_verson:QIIME2-2019.7
# Function: Import single-end sequence and summary
#==========================================================

# Startup environment
# Modify the environment path as needed
# get USER HOME PATH
HOME_PATH=`env|grep ^HOME=|cut -c 6-`
source ${HOME_PATH}/miniconda3/bin/activate qiime2-2019.7


# import data
qiime tools import --type 'SampleData[SequencesWithQuality]' --input-path $1/Analysis_TEMP/sample_mainlist.txt \
--output-path $1/Analysis_TEMP/Cluster_TEMP/single-seqs.qza --input-format SingleEndFastqManifestPhred33

# summarize
qiime demux summarize --i-data $1/Analysis_TEMP/Cluster_TEMP/single-seqs.qza --o-visualization $1/Analysis_TEMP/Cluster_TEMP/single-seqs.qzv

# export data
qiime tools export --input-path $1/Analysis_TEMP/Cluster_TEMP/single-seqs.qzv --output-path $1/Analysis_TEMP/Quality

# TEM: Need to modify
source ${HOME_PATH}/miniconda3/bin/deactivate
