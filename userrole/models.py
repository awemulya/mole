from __future__ import unicode_literals

from datetime import datetime
from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _

from django.conf import settings
from django.contrib.auth.models import Group
from django.db import models

from office.models import Office
from reports.models import FiscalYear



class UserRole(models.Model):
    user = models.ForeignKey(settings.AUTH_USER_MODEL, related_name='user_roles')
    group = models.ForeignKey(Group)
    office = models.ForeignKey(Office, related_name='office_roles', blank=True, null=True)
    fiscal_year = models.ForeignKey(FiscalYear, related_name='current_fiscal_year', default='1')
    started_at = models.DateTimeField(default=datetime.now)
    ended_at = models.DateTimeField(blank=True, null=True)

    def __str__(self):
        return 'user: {}\'s role : {}'.format(self.user.__unicode__(), self.group.__unicode__())

    class Meta:
        unique_together = ('user', 'group', 'office')

    def clean(self):
        if self.group.name in ['Office Head', 'Information Officer'] and not self.office_id:
            raise ValidationError({
                'company': ValidationError(_('Missing Office.'), code='required'),
            })


        if self.user and UserRole.objects.filter(user=self.user, group=self.group, office=self.office).exists():
            raise ValidationError({
                'user': ValidationError(_('User Role Already Exists.')),
            })

    def save(self, *args, **kwargs):
        if self.group.name in ['Super Admin', 'Admin Assistant']:
            self.office = None
        super(UserRole, self).save(*args, **kwargs)

    def update(self, *args, **kwargs):
        if self.group.name in ['Super Admin', 'Admin Assistant']:
            self.office = None
        super(UserRole, self).update(*args, **kwargs)

    @staticmethod
    def is_active(user, group):
        return UserRole.objects.filter(user=user, group__name=group, ended_at=None).exists()

    @staticmethod
    def get_office(user_id):
        role = UserRole.objects.filter(user__id=user_id)
        return role[0].office

    @staticmethod
    def get_group(user_id):
        role = UserRole.objects.filter(user__id=user_id)
        return role[0].group

    @staticmethod
    def get_active_roles(user):
        return UserRole.objects.filter(user=user, ended_at=None).select_related('group', 'office')

    @staticmethod
    def get_active_office_roles(user, office):
        return UserRole.objects.filter(user=user, office=office, ended_at=None, group__name__in= []).\
            select_related('group', 'office')\

    @staticmethod
    def get_office_user(group, office_id):
        if UserRole.objects.filter(office__id=office_id, ended_at=None, group__name=group, user__is_active=True).exists():
            return UserRole.objects.filter(office__id=office_id, ended_at=None, group__name=group).first()
        return False

    @staticmethod
    def get_office_users(group, office_id):
        if UserRole.objects.filter(office__id=office_id, ended_at=None, group__name=group, user__is_active=True).exists():
            return UserRole.objects.filter(office__id=office_id, ended_at=None, group__name=group)
        return False


