from django.urls import path, include
from rest_framework import routers
from myapp import views

urlpatterns = [
    path('', views.SampleView.as_view()),
]
