import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

df=pd.read_csv("presentation.csv")
loc=df['Organisation'].unique()
n=loc.size

from geopy.geocoders import ArcGIS
nom=ArcGIS()
rows= len(df.axes[0])


longi=[]
lati=[]
for i in range(0,n):
    a=nom.geocode(loc[i])
    longi.append(a.raw['location']['x'])
    lati.append(a.raw['location']['y'])
    
rows = len(df.axes[0])

final_longi=[]
final_lati=[]
flag=0
for i in range(0,rows):
    flag=0
    str=df['Organisation'][i]
    for j in range(0,n):
        if(str==loc[j]):
            flag=1
            final_longi.append(longi[j])
            final_lati.append(lati[j])
    if(flag==0):
        final_longi.append('NaN')
        final_lati.append('NaN')



df['Longitude'] = final_longi
df['Latitude']=final_lati


from math import cos, asin, sqrt, pi

#All distance are in km
def distance(lat1, lon1, lat2, lon2):
    p = pi/180
    a = 0.5 - cos((lat2-lat1)*p)/2 + cos(lat1*p) * cos(lat2*p) * (1-cos((lon2-lon1)*p))/2
    return 12742 * asin(sqrt(a)) 


def event_recommend_for_scientist(longi,lati):
    minimum=1e9
    ind=-1
    for i in range(0,rows):
        longi1=df['Longitude'][i]
        lati1=df['Latitude'][i]
        if(longi1=='Nan' or lati1 =='NaN'):
            continue
        dist=distance(lati,longi,lati1,longi1)
        if(minimum>dist):
            minimum=dist
            ind=i
    if(ind==-1):
        return "Not fetch"
    return df['Organisation'][ind]


longi=float(input("Enter longitude:"))
lati=float(input("Enter latitude:"))
print("You can visit:" ,event_recommend_for_scientist(longi,lati))
