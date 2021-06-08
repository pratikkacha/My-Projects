#!/usr/bin/env python
# coding: utf-8

# In[4]:


import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
Location = "downloads/datasets/gradedata.csv"
df = pd.read_csv(Location)
df.head(10)


# In[26]:


print(df.describe()) #description 


# In[27]:


print(df.shape) #shape


# In[29]:


#summarize the data
from pandas import read_csv
# Load dataset
Location = "downloads/datasets/gradedata.csv"
df = pd.read_csv(Location)
df.head(10)
# shape
print(df.shape)
# head
print(df.head(10))
# descriptions
print(df.describe())
# class distribution
print(df.groupby('age').size())


# In[12]:


df.hist(column="grade", by="gender")


# In[32]:


df.hist()
pyplot.show()


# In[34]:


# scatter plot matrix
from pandas.plotting import scatter_matrix
scatter_matrix(df)
pyplot.show()


# In[9]:


feature =np.array ([['New Jersey'],['Massachusetts'],['Ohio'],['Florida'],['Ohio'],['New Jersey'],['Pennsylvania'],['Michigan'],['Louisiana'],['Tennessee']])
import pandas as pd
#Create dummy variables from feature
pd.get_dummies(feature[:,0])


# In[10]:


columns = ['fname', 'lname','gender', 'exercise', 'grade'] 
df = pd.DataFrame(data = pd.read_csv(Location), columns=columns)
df.head()


# In[18]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
plt.scatter(df['grade'], df['exercise'])


# In[ ]:




