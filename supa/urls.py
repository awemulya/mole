from django.conf.urls import url
from . import views
from .decorators import template_based_on_user_type

app_name = 'mole'

urlpatterns = ([

    url(r'^$', views.dashboard, name="dashboard"),
    url(r'^addoffice/$', views.AddOffice.as_view(), name="addoffice"),
    url(r'^adduser/$', views.AddUser.as_view(), name="adduser"),
    url(r'^listoffice/$', views.officelist, name="listoffice"),
    url(r'^listproject/$', views.projectlist, name="listproject"),
    url(r'^listmunicipality/$', views.municipalitylist, name="listmunicipality"),
    url(r'^detailoffice/(?P<pk>\d+)/$', views.officedetail, name='detailoffice'),
    url(r'^editoffice/(?P<pk>\d+)/$', views.officeedit, name='editoffice'),
    url(r'^deleteoffice/(?P<pk>\d+)/$', views.officedelete, name='deleteoffice'),
   # url(r'^updateoffice/(?P<pk>[0-9]+)/$', views.OfficeDetailView.as_view(), name='office-update'),
   	url(r'^formlist/$', views.formlist, name="formlist"),
    url(r'^formdetail/(?P<pk>\d+)/$', views.formdetail, name='formdetail'),
    url(r'^ajaxgetdepartment/$', views.ajaxgetdepartment, name="ajaxgetdepartment"),

    url(r'^ajaxgetcategory/$', views.ajaxgetcategory, name="ajaxgetcategory"),
    url(r'^darchulalist/$', views.darchulalist, name="darchulalist"),
    url(r'^kanchanpurlist/$', views.kanchanpurlist, name="kanchanpurlist"),
    url(r'^dadeldhuralist/$', views.dadeldhuralist, name="dadeldhuralist"),
    url(r'^kailalilist/$', views.kailalilist, name="kailalilist"),
    url(r'^bajanglist/$', views.bajanglist, name="bajanglist"),
    url(r'^baitadilist/$', views.baitadilist, name="baitadilist"),
    url(r'^dotilist/$', views.dotilist, name="dotilist"),
    url(r'^achhamlist/$', views.achhamlist, name="achhamlist"),
    url(r'^bajuralist/$', views.bajuralist, name="bajuralist"),
    url(r'^addactivity/$', views.Addactivity.as_view(), name="addactivity"),
    url(r'^allactivity/$', views.allactivity, name="allactivity"),

    url(r'^activitydetail/(?P<pk>\d+)/$', views.activitydetail, name="activitydetail"),
    url(r'^allactivityreport/$', views.allactivityreport, name="allactivityreport"),
    url(r'^staffactivity/$', views.staffactivitylist, name='staffactivity'),
    url(r'^editstaffactivity/(?P<pk>\d+)/$', views.staffactivityedit, name='editstaffactivity'),

])


