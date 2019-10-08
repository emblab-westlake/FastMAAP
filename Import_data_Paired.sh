#!/usr/bin/bash
#==========================================================
# Author:zhangguoqing
# Email.zhangguoqing84@westlake.edu.cn
# Date:2019-8-3
# Version: 2.0
# Update:2019-8-6
# Qiime_version:QIIME2-2019.7
# Function: Import Paired-end sequence and summary
#==========================================================

# Startup environment
# Modify the environment path as needed
HOME_PATH=`env|grep ^HOME=|cut -c 6-`
source ${HOME_PATH}/miniconda3/bin/activate qiime2-2019.7


# import data
qiime tools import --type 'SampleData[PairedEndSequencesWithQuality]' --input-path $1/Analysis_TEMP/sample_mainlist.txt \
--output-path $1/Analysis_TEMP/Cluster_TEMP/paired-seqs.qza --input-format PairedEndFastqManifestPhred33

# summarize
qiime demux summarize --i-data $1/Analysis_TEMP/Cluster_TEMP/paired-seqs.qza --o-visualization $1/Analysis_TEMP/Cluster_TEMP/paired-seqs.qzv

# export data
qiime tools export --input-path $1/Analysis_TEMP/Cluster_TEMP/paired-seqs.qzv --output-path $1/Analysis_TEMP/Quality
source ${HOME_PATH}/miniconda3/bin/deactivate
