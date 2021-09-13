#!/usr/bin/env python
# coding: utf-8

# <head>
#     <style>
#         h1{
#             color: red ;
#         }
#     </style>
# </head>

# # Introduction : 
# <p>Import des librairies nécessaires pour faire le TP</p>

# In[1]:


import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import random
import datetime
get_ipython().run_line_magic('matplotlib', 'inline')


# # Question 2 : 
# <p> Développer une fonction qui réalise N tests. </p>

# In[2]:


# Pour simplifier on ne donne pas de nom aux cartes mais on leur donne un numéro entre 0 et 10
def Ntests(N):
    tirage = np.random.randint(0,11,N)
    return tirage


# In[3]:


N = 30
experience = Ntests(N)
print(experience)


# # Question 3 :
# <p>Réaliser un frame composé de la date de test et du nombre
# de tirage.</p>

# In[4]:


date = datetime.datetime.now()
df1 = pd.DataFrame(data={'Date':[date],'Nombre de tirage':[N]})
print(df1)


# In[5]:


def dataframeDateEtTest(N):
    i=0
    date = [] #Liste des dates
    tirage = [] #Liste des nombre tiré
    while i<N:
        date.append(datetime.datetime.now())
        tirage.append(random.randint(0,10))
        i+=1
    df = pd.DataFrame(data={"Date":date,'Tirage':tirage})
    return df


# # Question 4 : 
# <p>Afficher la structure du frame.</p>

# In[6]:


frame = dataframeDateEtTest(30)
print(frame)


# # Question 5 : 
# <p> Afficher la courbe des tirages.</p>

# In[7]:


NombreDeValeur = frame['Tirage'].value_counts()
print(NombreDeValeur)


# In[8]:


NombreDeValeur = NombreDeValeur.sort_index()
print(NombreDeValeur)


# In[9]:


X = list(range(0,NombreDeValeur.shape[0]))
X


# In[10]:


plt.figure(figsize=(10,10))
plt.bar(X,NombreDeValeur)
plt.show() # Tracer


# # Question 6 : 
# <p>  Exporter le frame dans un fichier excel</p>

# In[11]:


frame.to_excel("TP1_py.xlsx")


# In[ ]:




