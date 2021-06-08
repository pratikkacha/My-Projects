#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd
Location = "downloads/Position_Salaries.csv"
df = pd.read_csv(Location)
df.head(30)


# In[7]:


import matplotlib.pyplot as plt

x = [1,2,2,3,3,4,4,5,6,7,8,9,10,11,12,13,6,6,1,8,11,2,14,14,15,15,15,15]
y = [25000,30000,38000,42000,44000,46000,45000,50000,60000,70000,80000,90000,110000,150000,200000,300000,75000,68000,22000,95000,120000,20000,480000,500000,1000000,1100000,900000,1300000]

plt.scatter(x, y)
plt.show()


# In[10]:


import pandas as pd
from sklearn import linear_model

Location = "downloads/Position_Salaries.csv"
df = pd.read_csv(Location)

x = df[['Level']]
y = df['Salary']

regr = linear_model.LinearRegression()
regr.fit(x, y)

print()


# In[13]:


from sklearn import datasets

digits = datasets.load_digits()

features = digits.data

target = digits.target

features[0]


# In[16]:


import numpy as np
#Create feature
feature =np.array ([['Business Trainee'],['Business Intern'],['Junior Business Analyst'], ['Business Analyst'],['Junior Consultant'], ['Senior Consultant'],['Deputy Manager'],['Manager']])


# In[19]:


import pandas as pd

pd.get_dummies(feature[:,0])


# In[22]:



predictedSalary = regr.predict([[8]])

print(predictedSalary)

dataframe = pd.DataFrame()

dataframe ['Employee']=['Manager', 'Manager']
dataframe ['Salary']= [80000,95000]
dataframe ['Level']= [8,8]

dataframe


# In[ ]:




