import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("publications.csv")
rows= len(df.axes[0])

def success_percent(title):
    total_count=0
    success_count=0
    for i in range(0,rows):
        if(df['Titre/Title'][i]==title):
            total_count+=1
            if(df['Réponse/ Answer'][i]=='Yes'):
                success_count+=1
    if(total_count==0):
        return 0
    percentage=(success_count/total_count)*100
    return percentage
                
            
title=input("Enter event name:")
print("Effective percentage is:",success_percent(title))