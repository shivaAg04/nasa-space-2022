from datetime import datetime
from email.policy import default
from django.db import models
# import jsonfield
from django.contrib.auth.models import User
# Create your models here.


class Profile(models.Model):
    user_id=models.OneToOneField(User,null=True,on_delete=models.SET_NULL)
    user_type=models.TextField(max_length=20, blank=True, default=None)
    social_link=models.URLField(blank=True,default=None)
    institute=models.CharField(max_length=100,blank=True,default=None)
    specialization=models.CharField(max_length=100,blank=True,default=None)
    achievements=models.TextField(null=True,blank=True)
    about_me=models.TextField(null=True,blank=True)
    picture=models.URLField(null=True,blank=True)

class EventDetail(models.Model):
    created_by=models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
    place=models.CharField(max_length=100,null=True,blank=True)
    address=models.TextField(null=True,blank=True)
    status=models.IntegerField(default=1,null=True)
    timestamp=models.DateTimeField(default=datetime.now)
    about_event=models.TextField(null=True,blank=True)
    event_on=models.DateTimeField() 
    event_recording=models.URLField(null=True,blank=True)
    resources=models.TextField(null=True,blank=True)


class EventBooking(models.Model):
    user=models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
    status=models.IntegerField(default=1,null=True)
    timestamp=models.DateTimeField(default=datetime.now)
    event=models.ForeignKey(EventDetail,on_delete=models.SET_NULL,null=True)


class EventAttendance(models.Model):
    marked_by=models.ForeignKey(User,related_name='marked_by_User',on_delete=models.SET_NULL,null=True)
    status=models.IntegerField(default=1,null=True)
    timestamp=models.DateTimeField(default=datetime.now)
    event=models.ForeignKey(EventDetail,on_delete=models.SET_NULL,null=True)
    attend_by=models.ForeignKey(User,related_name='attend_by_User',on_delete=models.SET_NULL,null=True)

class Review(models.Model):
    user=models.ForeignKey(User,on_delete=models.SET_NULL,null=True)
    status=models.IntegerField(default=1,null=True)
    timestamp=models.DateTimeField(default=datetime.now)
    event=models.ForeignKey(EventDetail,on_delete=models.SET_NULL,null=True)
    remark=models.JSONField(blank=True,null=True)
