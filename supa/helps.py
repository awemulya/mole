source supaapp/bin/activate




python manage.py runserver



python manage.py shell
from django.contrib.auth.models import User
david = User.objects.get(username="david")
david.get_all_permissions()





netstat -ntlp

kill -9 PID

###user.set_password('_new_password_')



class OfficeListView(LoginRequiredMixin, PermissionRequiredMixin, generic.ListView):
	permission_required = ('supa.can_add_office')
	login_url = '/login/'
	redirect_field_name = 'redirect_to'
	template_name = 'supaadmin/officelist.html'
	context_object_name = 'office_list'

	def get_queryset(self):
		return Office.objects.order_by('-id')[:5]
        """Return the last five published questions."""

class OfficeDetailView(LoginRequiredMixin, PermissionRequiredMixin, generic.DetailView):
	
	permission_required = ('supa.can_add_office')
	login_url = '/login/'
	redirect_field_name = 'redirect_to'
	model = Office

