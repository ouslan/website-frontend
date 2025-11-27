# urls.py
from django.urls import path
from . import views

urlpatterns = [
    path("", views.blog_index, name="index"),  # Blog index view
]
