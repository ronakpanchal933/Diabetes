#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt


# In[2]:


data = pd.read_csv("D:\\Data Sets and practice work\\Data\\diabetesdataset.csv")


# In[3]:


data


# In[4]:


data.shape


# In[5]:


data.info()


# In[6]:


data.describe()


# In[7]:


#Explore missing values


# In[8]:


data.isnull().sum()


# In[9]:


# Correcting missing values in Glucose


# In[10]:


data['Glucose'] = data['Glucose'].replace(0,data['Glucose'].mean())
data.Glucose.value_counts()


# In[11]:


# Correcting missing values in blood pressure


# In[12]:


data['BloodPressure'] = data['BloodPressure'].replace(0, data['BloodPressure'].mean())
data.BloodPressure.value_counts()


# In[16]:


sns.boxplot(x='Outcome', y='Glucose', data=data)
plt.title('Glucose Levels by Outcome')
plt.show()


# In[18]:


corr_matrix = data.corr()
sns.heatmap(corr_matrix, annot=True, cmap='coolwarm')
plt.title('Correlation Matrix Heatmap')
plt.show()


# In[28]:


sns.violinplot(x='Outcome', y='BMI', data=data)
plt.title('BMI Distribution by Outcome')
plt.show()


# In[29]:


sns.lineplot(x='Age', y='BloodPressure', data=data)
plt.title('Blood Pressure Over Age')
plt.show()


# In[32]:


sns.pairplot(data[['Glucose', 'BMI', 'Age', 'Outcome']], hue='Outcome')
plt.title('Pairplot of Selected Columns')
plt.show()


# In[39]:


sns.kdeplot(data['Insulin'], fill=True)
plt.title('Kernel Density Estimate of Insulin')
plt.show()


# In[ ]:




