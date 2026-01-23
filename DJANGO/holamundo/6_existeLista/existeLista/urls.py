
from django.contrib import admin
from django.urls import path
from miApp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.existe_lista),
    
]
