
from django.utils import six
from django.core.exceptions import PermissionDenied
from django.contrib.auth.decorators import user_passes_test


def template_based_on_user_type(supaadmin_template, supamanager_template, officemanager_template, officestaff_template):
    def decorator(your_view_function):
        def inner_decorator(request, *args, **kwargs):
            # this is the logic that checks the user type before 
            # every invocation of this view:
            if request.user.groups.values_list('name', flat=True).first() == "supa-admin":
                template = supaadmin_template
                base_template = 'supa-admin/base.html'
            elif request.user.groups.values_list('name', flat=True).first() == "supa-manager":
                template = supamanager_template
                base_template = 'supa-manager/base.html'
            elif request.user.groups.values_list('name', flat=True).first() == "office-manager":
                template = officemanager_template
                base_template = 'office-manager/base.html'
            elif request.user.groups.values_list('name', flat=True).first() == "office-staff":
                template = officestaff_template
                base_template = 'office-staff/base.html'
            else:
                template = "error.html"
                base_template = 'error.html'
            # this is the invocation of the view function, with
            # a custom template selected:
            return your_view_function(request, *args, template = template, base_template = base_template, **kwargs)
        return inner_decorator
    return decorator


def group_required(group, login_url='/login/', raise_exception=False):
    """
    Decorator for views that checks whether a user has a group permission,
    redirecting to the log-in page if necessary.
    If the raise_exception parameter is given the PermissionDenied exception
    is raised.
    """
    def check_perms(user):
        if isinstance(group, six.string_types):
            groups = (group, )
        else:
            groups = group
        # First check if the user has the permission (even anon users)

        if user.groups.filter(name__in=groups).exists():
            return True
        # In case the 403 handler should be called raise the exception
        if raise_exception:
            raise PermissionDenied
        # As the last resort, show the login form
        return False
    return user_passes_test(check_perms, login_url=login_url)











#for groupprofile id template = request.user.groups.values_list('groupprofile', flat=True).first()




    # def template_based_on_user_type(supaadmin_template, ordinary_template):
    # def decorator(your_view_function):
    #     def inner_decorator(request, *args, **kwargs):
    #         # this is the logic that checks the user type before 
    #         # every invocation of this view:
    #         if request.user.groups.filter(name='').exists():
    #             template = supaadmin_template
    #         elif request.user.profile.post.post == 'admin':
    #             template = ordinary_template
    #         else:
    #             template = "error.html"

    #         # this is the invocation of the view function, with
    #         # a custom template selected:
    #         return your_view_function(request, template)
    #     return inner_decorator
    # return decorator