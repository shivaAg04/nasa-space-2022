from django.urls import path
from . import views

urlpatterns=[
    path('login/',views.login_user,name="login"),
    path('logout/',views.logout_user,name="logout"),
    path('profile/',views.create_profile,name="create_profile"),
    path('create_event/',views.create_event,name="create_event"),
    path('view_events/',views.view_events,name="view_events"),
    path('give_review/',views.give_review,name="give_review"),
    path('get_recommendation/',views.get_recommendation,name="get_recommendation"),
]