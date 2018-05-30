from django.conf.urls import url


from office.views import  OfficeDetailView, \
    OfficeUserView, OfficeBudgetUpdateView

app_name = 'office'

from office.views import OfficeCreateView, OfficeListView, OfficeUpdateView, OfficeDeleteView,\
    OfficeAddOfficeHeadView, OfficeAddInfoofficerView, Monthly, OfficeDashboard, DistrictDashboard, ProfileDetailView, ProfileUpdateView, OfficeKaryakramList,\
    OfficeViewDataDetail, OfficePragati


urlpatterns = [

    url(r'^office/create/$', OfficeCreateView.as_view(), name='office-add'),
    url(r'^office/dashboard/(?P<pk>[0-9]+)/$', OfficeDashboard.as_view(), name='office-dashboard'),
    url(r'^office/pragati/(?P<pk>[0-9]+)/$', OfficePragati.as_view(), name='office-pragati'),
    url(r'^office/detail/(?P<pk>[0-9]+)/$', OfficeDetailView.as_view(), name='office-detail'),
    url(r'^office/view-data-detail/(?P<pk>[0-9]+)/$', OfficeViewDataDetail.as_view(), name='view-data-detail'),
    url(r'^office/users/(?P<pk>[0-9]+)/$', OfficeUserView.as_view(), name='office-users'),

    url(r'^district/dashbaord/(?P<pk>[0-9]+)/$', DistrictDashboard.as_view(), name='district-dashboard'),
    url(r'^office/dashboard/(?P<pk>[0-9]+)/karyakramlist/$', OfficeKaryakramList.as_view(), name='office-karyakram-list'),
    url(r'^office/update/(?P<pk>[0-9]+)/$', OfficeUpdateView.as_view(), name='office-update'),
    url(r'^office/delete/(?P<pk>[0-9]+)/$', OfficeDeleteView.as_view(), name='office-delete'),
    url(r'^office/list/$', OfficeListView.as_view(), name='office-list'),
    url(r'^office/(?P<pk>[0-9]+)/adduser/addofficehead/$', OfficeAddOfficeHeadView.as_view(), name='office-add-office-head'),
    url(r'^office/(?P<pk>[0-9]+)/adduser/addinfoofficer/$', OfficeAddInfoofficerView.as_view(), name='office-add-info-officer'),
    #url(r'^office/(?P<pk>[0-9]+)/addtype/$', OfficeAddUserView.as_view(), name='office-addtype'),
    
    url(r'^office/addbudget/(?P<pk>[0-9]+)/$', OfficeBudgetUpdateView.as_view(), name='office-budget-update'),
    url(r'^deactivate_user/$', ProfileUpdateView.as_view(), name='deactivate-users'),
    url(r'^office/users/profile_update/(?P<pk>[0-9]+)/$', ProfileUpdateView.as_view(), name='profile-update'),
    url(r'^office/users/profile_detail/(?P<pk>[0-9]+)/$', ProfileDetailView.as_view(), name='profile-detail'),
    url(r'^office/monthly/$', Monthly.as_view(), name='monthly-report'),
    

        ]
