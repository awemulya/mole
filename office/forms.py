from django import forms
from django.contrib.auth.forms import UserCreationForm
from models import Office
from django.contrib.auth.models import User
from reports.models import OfficeBudget
from users.models import Profile

class OfficeForm(forms.ModelForm):
    class Meta:
        model = Office
        exclude = ()

class OfficeEditForm(forms.ModelForm):
    class Meta:
        model = Office
        exclude = ('is_project', 'is_municipality','district','department')

class UserForm(UserCreationForm):
    
    email = forms.EmailField(max_length=254, help_text='Required. Inform a valid email address.')
   
    password1 = forms.CharField(initial='sa2das33@dsErZZasd')
    password2 = forms.CharField(initial='sa2das33@dsErZZasd')
    class Meta:
        model = User
        fields = ('username', 'email', 'password1', 'password2')

class OfficeBudgetForm(forms.ModelForm):
    class Meta:
        model = OfficeBudget
        exclude = ('office',)

class ProfileUpdateForm(forms.ModelForm):
    class Meta:
        model = Profile
        exclude = ('user', 'email_confirmed', 'assign_date',)