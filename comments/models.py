# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from django.contrib.auth.models import User
from django.db import models
from django.contrib.contenttypes.models import ContentType
from django.contrib.contenttypes.fields import GenericForeignKey

class Comments(models.Model):
    comment_obj_content_type = models.ForeignKey(ContentType, related_name='notify_object', blank=True, null=True)
    comment_obj_object_id = models.CharField(max_length=255, blank=True, null=True)
    comment_obj = GenericForeignKey('comment_obj_content_type', 'comment_obj_object_id')
    comment = models.TextField()
    commented_by = models.ForeignKey(User, related_name="users")
    date_commented = models.CharField(max_length=10, null=True, blank=True)
    date_edited = models.CharField(max_length=10, null=True, blank=True)
    def __unicode__(self):
        return u'%s' % (self.commented_by) + "--" + u'%s' % (self.comment_obj)