from django.conf.urls import url


from .views import MonthlyControlList, MonthlyProgressList, MonthlyProgressCreateView, MonthlyProgressDetail, MonthlyKaryakramCreateView, MonthlyChildKaryakramCreateView

app_name = 'karyasampadan'

urlpatterns = [
    url(r'^monthlylist/(?P<office>[0-9]+)/$', MonthlyControlList.as_view(), name='monthly-control-list'),
    url(r'^monthlyallprogresslist/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/$', MonthlyProgressList.as_view(), name='monthly-all-progress-list'),
    url(r'^addmonthlypragati/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/(?P<month_id>[0-9]+)/$', MonthlyProgressCreateView.as_view(), name='add-monthly-pragati'),
    url(r'^monthlyprogressdetail/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/$', MonthlyProgressDetail.as_view(), name='monthly-progress-detail'),    
    url(r'^monthlykaryasampadan/create/(?P<office>[0-9]+)/$', MonthlyKaryakramCreateView.as_view(), name='monthly-karyasampadan-add'),
    url(r'^monthlykaryasampadan/create/child/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/$', MonthlyChildKaryakramCreateView.as_view(), name='monthly-karyasampadan-add-child'),
    
        ]
