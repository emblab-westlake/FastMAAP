#-*- coding: utf-8 -*-
# Author:zhangguoqing
# Date:2018-9-20
# Version: 1.0
# Function: get argv of Reverse

import numpy as np
import pandas as pd
Reverse_table = pd.read_csv("Analysis_TEMP/Quality/reverse-seven-number-summaries.csv")
Reverse_list = np.array(Reverse_table[4:5]).tolist()[0]
Reverse_list.remove('50%')
n = 0
for i in Reverse_list:
    n = n+1
    if i < 20:
        print(n-1) # print position
        break
    while n == len(Reverse_list):
        print(n)
        break