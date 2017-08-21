from django.contrib import admin

from .models import Profile, Post, GroupProfile, Form, Form_status, Office
from .models import Yearly, First, Second, Third

myformModels = [Form, Form_status, Yearly, First, Second, Third]

myofficeModels = [Office]


admin.site.register(Profile)
admin.site.register(Post)
admin.site.register(GroupProfile)


admin.site.register(myofficeModels)
admin.site.register(myformModels)
