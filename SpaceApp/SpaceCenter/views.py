import re
from django.http import JsonResponse
import json
from django.contrib.auth.models import *
from allauth.socialaccount.models import SocialAccount
from django.contrib.auth import authenticate ,login,logout
from datetime import datetime
from .models import *
import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
from geopy.geocoders import ArcGIS
from math import cos, asin, sqrt, pi
# Create your views here.


def login_user(request):
    # if request.user.is_authenticated:
    #     image=SocialAccount.objects.filter(user_id=request.user.id,provider='google').values('extra_data')[0]['extra_data']['picture']
    #     data={
    #         'msg':"Login complete",
    #         'email':request.user.email,
    #         'fname':request.user.first_name,
    #         'lname':request.user.last_name,
    #         'image':image
    #     }
    #     return JsonResponse(data,status=200,safe=False)
    if request.method=='POST':
        data=json.loads(request.body)
        fname=data['first_name'].strip()
        lname=data['last_name'].strip()
        username=data['username'].strip()
        password=data['password'].strip()
        email=data['email'].strip()
        if username and password:
            if User.objects.filter(username=username).exists():
                user=authenticate(request,username=username,password=password)
                if user is not None :
                    if user.is_active:
                        login(request,user)
                        # request.session['user_id']=request.user.id
                        return JsonResponse({'msg':'Logged in successfully!'},status=200,safe=False)      
            else:
                User.objects.create_user(username=username,password=password,email=email,first_name=fname,last_name=lname)
                return JsonResponse({'msg':'Created successfully'},status=201,safe=False)
        else:
            return JsonResponse('Empty fields',status=404,safe=False)
    else:
      return JsonResponse('Some Error Occured',status=403,safe=False)

def logout_user(request):
    if request.user.is_authenticated:
      return JsonResponse('Logged out',status=200,safe=False)
    else:
       return JsonResponse('Could not logout!',status=302,safe=False)


def create_profile(request):
    # if request.user.is_authenticated:
        user_id=request.user.id
        # print(user_id)
        if request.method=="POST":
            data=json.loads(request.body)
            # fname=data['first_name'].strip()
            # lname=data['last_name'].strip()
            # username=data['username'].strip()
            # password='1234'
            # email=data['email'].strip()
            user_type=data['user_type'].strip().upper()
            print(email)
            if(user_type is not None):
                user_id=User.objects.filter(email=data['email']).values('id')[0]['id']
                print(user_id)
                # Profile.objects.create(user_id=User.objects.get(id=user_id),user_type=user_type,institute=data['institute'],about_me=data['about_me'],social_link=data['social_link'],specialization=data['specialization'],achievements=data['achievements'],picture=data['picture'])
                return JsonResponse(data,status=201,safe=False)
            else:
                return JsonResponse({'msg':'Fields cannot be empty'},status=304,safe=False)
        elif request.method=="GET":
            user_email=request.GET['email']
            # try:
            if User.objects.filter(email=user_email).exists():
                user_id=User.objects.get(email=user_email).id
                if len(Profile.objects.filter(user_id=User.objects.get(id=user_id)))>0:
                    data=list(Profile.objects.filter(user_id=User.objects.get(id=user_id)).values('user_id','user_id__email','user_id__first_name','user_id__last_name','user_id__username','social_link','institute','about_me','achievements','specialization','picture'))
                    return JsonResponse(data,status=200,safe=False)
                else:
                    print(user_email,'email')
                    qry=list(User.objects.filter(email=user_email).values('email','first_name','last_name','username'))
                    data={'msg':'Profile does not exist',
                    'data':qry}
                    return JsonResponse(data,status=200,safe=False)
            else:
                data={'msg':'User does not exist'}
                return JsonResponse(data,status=204,safe=False)
        elif request.method=="PUT":
            data=json.loads(request.body)
            user_id=data['id']
            fname=data['first_name'].strip()
            lname=data['last_name'].strip()
            username=data['username'].strip()
            password=data['password'].strip()
            email=data['email'].strip()
            user_type=data['user_type'].strip().upper()
            if(password is not None and username is not None and email is not None and user_type is not None):
                user=User.objects.filter(id=data['user_id']).update(first_name=fname,last_name=lname)
                Profile.objects.filter(user_id=user_id).update(institute=data['institute'],about_me=data['about_me'],social_link=data['social_link'],specialization=data['specialization'],achievements=data['achievements'],picture=data['picture'])
                return JsonResponse({'msg':'Data successfully updated'},status=201,safe=False)
            else:
                return JsonResponse({'msg':'Fields cannot be empty'},status=304,safe=False)
        else:
            return JsonResponse({'msg':'Some error occured'},status=302,safe=False)
    # else:
    #     return JsonResponse({'msg':'You are unauthenticated'},status=401,safe=False)



def create_event(request):
    # if request.user.is_authenticated:
        user_id=request.user.id
        if request.method=="POST":
            user_type=Profile.objects.get(user_id=user_id).user_type
            if user_type=='SCIENTIST':
                data=json.loads(request.body)
                EventDetail.objects.create(created_by=user_id,place=data['place'],address=data['address'],event_on=data['event_date'],about_event=data['about_event'])
                return JsonResponse({'msg':'Event Created successfully'},status=201,safe=False)
            else:
                return JsonResponse({'msg':'You do not have the permission to access this page'},status=403,safe=False)
        elif request.method=="GET":
            if request.GET['request_type']=='view_previous':
                data=list(EventDetail.objects.filter(created_by=user_id).exclude(status=0).values('event_about','address','event_on','place','id','resources','event_recording'))
                return JsonResponse(data,status=200,safe=False)
            
            if request.GET['request_type']=='view_bookings':
                event_id=request.GET['event_id']
                data=list(EventBooking.objects.filter(event=event_id).exclude(status=0).values('user_id','user_id__email','user_id__first_name','event_id__last_name','','resources','event_recording'))
                return JsonResponse(data,status=200,safe=False)
            
        elif request.method=="DELETE":
                event_id=request.GET['event_id']
                EventDetail.objects.filter(id=event_id).update(status=0)
                return JsonResponse({'msg':'Successfully deleted'},status=200,safe=False)
        else:
            return JsonResponse({'msg':'Some error occured'},status=302,safe=False)
    # else:
    #     return JsonResponse({'msg':'You are unauthenticated'},status=401,safe=False)


def view_events(request):
    user_id=request.user.id
    if request.GET['request_type']=='Upcoming_events':
        current_datetime=datetime.now()
        data=EventDetail.objects.filter(event_on__gt=current_datetime).exclude(status=0).values()
        return JsonResponse(list(data),status=200,safe=False)

    if request.GET['request_type']=='previous_attended_events':
        current_datetime=datetime.now()
        data=EventBooking.objects.filter(user_id=user_id,event_on__lt=current_datetime).exclude(status=0).values()
        return JsonResponse(list(data),status=200,safe=False)

def give_review(request):
    user_id=request.user.id
    if request.method=="POST":
        data=json.loads(request.body)
        Review.objects.create(user=User.objects.get(id=user_id),timestamp=datetime.now(),event=data['event_id'],remark=data['remark'])
        msg={'msg':"Successfully created"}
        return JsonResponse(msg,status=200,safe=False)

    if request.method=="GET":
        event_id=request.get['event_id']
        data=list(Review.objects.filter(event=event_id).values('user','user__email','user__first_name','user__last_name','remark'))


def distance(lat1, lon1, lat2, lon2):
    p = pi/180
    a = 0.5 - cos((lat2-lat1)*p)/2 + cos(lat1*p) * cos(lat2*p) * (1-cos((lon2-lon1)*p))/2
    return 12742 * asin(sqrt(a)) 


def event_recommend_for_scientist(longi,lati):
    df=pd.read_csv("presentation.csv")
    loc=df['Organisation'].unique()
    n=loc.size
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


def get_recommendation(request):
    data=json.loads(request.body)
    longi=data['longi']
    lati=data['lati']
    return event_recommend_for_scientist(longi,lati)