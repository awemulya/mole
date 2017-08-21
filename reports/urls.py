from django.conf.urls import url


from .views import KaryakramCreateView, KaryakramUpdateView, LakxyaCreateView, PragatiCreateView, KaryakramListView, \
    ReportView, KaryakramControlList, ThirdControlList, YearlyControlList, FirstControlList, SecondControlList, ChildKaryakramCreateView, \
    OfficeSettings, FilesSubmitted, MonthlyControlList, MonthlyProgressList, MonthlyProgressCreateView, MonthlyProgressDetail, MonthlyKaryakramCreateView, MonthlyChildKaryakramCreateView

app_name = 'reports'

urlpatterns = [
    url(r'^karyakram/list/(?P<office>[0-9]+)/$', KaryakramListView.as_view(), name='karyakram-list'),
    url(r'^office/settings/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', OfficeSettings.as_view(), name='office-settings'),
    url(r'^karyakram/controllist/(?P<office>[0-9]+)/$', KaryakramControlList.as_view(), name='karyakram-control-list'),
    url(r'^karyakram/yearlycontrollist/(?P<office>[0-9]+)/(?P<type>[0-9]+)/$', YearlyControlList.as_view(), name='yearly-control-list'),
    url(r'^karyakram/firstcontrollist/(?P<office>[0-9]+)/(?P<type>[0-9]+)/$', FirstControlList.as_view(), name='first-control-list'),
    url(r'^karyakram/secondcontrollist/(?P<office>[0-9]+)/(?P<type>[0-9]+)/$', SecondControlList.as_view(), name='second-control-list'),
    url(r'^karyakram/thirdcontrollist/(?P<office>[0-9]+)/(?P<type>[0-9]+)/$', ThirdControlList.as_view(), name='third-control-list'),
    url(r'^karyakram/create/(?P<office>[0-9]+)/$', KaryakramCreateView.as_view(), name='karyakram-add'),
    url(r'^karyakram/create/child/(?P<office>[0-9]+)/(?P<karyakram>[0-9]+)/$', ChildKaryakramCreateView.as_view(), name='karyakram-add-child'),
    url(r'^list/(?P<office>[0-9]+)/(?P<awadhi>[0-9]+)/$', ReportView.as_view(), name='reports'),
    url(r'^karyakram/update/(?P<office>[0-9]+)/(?P<pk>[0-9]+)/$', KaryakramUpdateView.as_view(), name='karyakram-update'),
    url(r'^karyakram/addlaksya/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/(?P<awadhi>[0-9]+)/$', LakxyaCreateView.as_view(), name='add-lakxya'),
    url(r'^karyakram/addpragati/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/(?P<awadhi>[0-9]+)/$', PragatiCreateView.as_view(), name='add-pragati'),
    url(r'^karyakram/filessubmited/(?P<office>[0-9]+)/$', FilesSubmitted.as_view(), name='files-submited'),
    url(r'^karyakram/monthlylist/(?P<office>[0-9]+)/$', MonthlyControlList.as_view(), name='monthly-control-list'),
    url(r'^karyakram/monthlyallprogresslist/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/$', MonthlyProgressList.as_view(), name='monthly-all-progress-list'),
    url(r'^karyakram/addmonthlypragati/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/(?P<month_id>[0-9]+)/$', MonthlyProgressCreateView.as_view(), name='add-monthly-pragati'),
    url(r'^karyakram/monthlyprogressdetail/(?P<office>[0-9]+)/(?P<karyakram_id>[0-9]+)/$', MonthlyProgressDetail.as_view(), name='monthly-progress-detail'),    
    url(r'^monthlykaryakram/create/(?P<office>[0-9]+)/$', MonthlyKaryakramCreateView.as_view(), name='monthly-karyakram-add'),
    url(r'^monthlykaryakram/create/child/(?P<office>[0-9]+)/(?P<karyakram>[0-9]+)/$', MonthlyChildKaryakramCreateView.as_view(), name='monthly-karyakram-add-child'),
    
        ]
