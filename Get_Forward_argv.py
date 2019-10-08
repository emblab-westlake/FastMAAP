#-*- coding: utf-8 -*-
# Author:zhangguoqing
# Date:2018-9-20
# Version: 1.0
# Function: get argv of Forward

import numpy as np
import pandas as pd
Forward_table = pd.read_csv("Analysis_TEMP/Quality/forward-seven-number-summaries.csv")
Forward_list = np.array(Forward_table[4:5]).tolist()[0]
Forward_list.remove('50%')
n = 0
for i in Forward_list:
    n = n+1
    if i < 20:
        print(n-1) # print position
        break
    while n == len(Forward_list):
        print(n)
        break