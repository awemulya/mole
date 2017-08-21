# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime
from userrole.mixins import CreateView, UpdateView, DeleteView, OfficerMixin, AdminAssistantMixin, AdminAssistantMixin, OfficeHeadMixin
from django.views.generic import View
from django.shortcuts import render, redirect
from django.http import HttpResponse
from reports.models import KaryaKram
from django.contrib.auth.mixins import LoginRequiredMixin
from .models import Comments
from reports.npdateconverter import NepaliDateConverter
from django.template.loader import render_to_string
from notifications.signals import notify
from channels import Group
from userrole.models import UserRole
from django.contrib.auth.models import User, Group as Groups
import json
from reports.models import KaryaKram
from django.contrib.contenttypes.models import ContentType
# Create your views here.
class Comment(LoginRequiredMixin, View):
    def get(self, request, pk):
        return redirect('user:login')

    def post(self, request, *args, **kwargs):
        com = Comments()
        a=request.user
        com.comment = request.POST.get('comment')
        com.comment_obj = KaryaKram.objects.get(pk=request.POST.get('k_id'))
        com.commented_by = request.user
        converter = NepaliDateConverter()
        com.date_commented = converter.ad2bs((datetime.date.today().year, datetime.date.today().month, datetime.date.today().day))
        com.save()
        
        if request.group.id == 4:
            recipients = User.objects.filter(user_roles__group__name="Office Head", user_roles__office__id=com.comment_obj.office.id)
            group = "office_head-"+str(com.comment_obj.office.id)
        else:
            recipients = User.objects.filter(user_roles__group__name="Information Officer", user_roles__office__id=com.comment_obj.office.id)
            group = "info_officer-"+str(com.comment_obj.office.id)
        
        notify.send(request.user, recipient=recipients, verb='commented on', action_object=com.comment_obj, detail_url = '/comment/add/22/')

        Group("%s" % group).send({
            'text': json.dumps({
                'by': str(request.user),
                'verb': "commented on",
                'time':"Just Now",
                'detail_url':"/comment/add/22/",
                'action_object':str(com.comment_obj),
            })
        })

        html = render_to_string('ajax_temp/ajaxcomments.html', {'comments': Comments.objects.filter(comment_obj_object_id=request.POST.get('k_id'), comment_obj_content_type=ContentType.objects.get_for_model(KaryaKram))})
        return HttpResponse(html)

class GetComment(LoginRequiredMixin, View):
    def get(self, request, pk):
        return redirect('user:login')

    def post(self, request, *args, **kwargs):
        k_id = request.POST.get('k_id')
        html = render_to_string('ajax_temp/ajaxcomments.html', {'comments': Comments.objects.filter(comment_obj_object_id=k_id, comment_obj_content_type=ContentType.objects.get_for_model(KaryaKram))})
        return HttpResponse(html)