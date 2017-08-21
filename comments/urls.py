from django.conf.urls import url


from comments.views import Comment, GetComment

app_name = 'comments'



urlpatterns = [

    url(r'^create/$', Comment.as_view(), name='comment-add'),
    url(r'^getcomment/$', GetComment.as_view(), name='comment-get'),

        ]
