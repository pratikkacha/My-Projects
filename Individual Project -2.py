#!/usr/bin/env python
# coding: utf-8

# In[2]:


import matplotlib.pyplot as plt
import pandas as pd
import numpy as np
Location = "downloads/datasets/axisdata.csv"
df = pd.read_csv(Location)
df.head()


# In[3]:


df['Cars Sold'].mean()  #1


# In[4]:


df['Cars Sold'].max()   #2


# In[25]:


df['Cars Sold'].min()   #3


# In[3]:


df.hist(column="Cars Sold", by="Gender")  #4


# In[18]:


df.loc[df['Hours Worked'] > 33.72 ,'Cars Sold'] = 3  #5
df.head()


# In[42]:


df['Years Experience'].mean()  #6


# In[19]:


df.loc[df['Years Experience'] > 3 ,'Cars Sold'] = 3  #7
df.head()


# In[28]:


df['Hours Worked'].mean()


# In[29]:


columns = ['Fname', 'Lname','Cars Sold', 'SalesTraining']   #8
df = pd.DataFrame(data = pd.read_csv(Location), columns=columns)
df.head()


# In[33]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
get_ipython().run_line_magic('matplotlib', 'inline')
plt.scatter(df['Cars Sold'], df['SalesTraining'])


# In[ ]:




