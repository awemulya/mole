# -*- coding: utf-8 -*-
from django.core.urlresolvers import reverse
from django.template import Library
from django.utils.html import format_html
from office.models import Office
from reports.models import FiscalYear

register = Library()


@register.assignment_tag(takes_context=True)
def office_list(context):
    return Office.objects.all()

@register.assignment_tag(takes_context=True)
def fiscalyearlist(context):
    return FiscalYear.objects.all()


def user_context(context):
    if 'user' not in context:
        return None

    request = context['request']
    user = request.user
    if user.is_anonymous():
        return None
    return user
