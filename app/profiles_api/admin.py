from django.contrib import admin

from app.profiles_api import models

admin.site.register(models.UserProfile)