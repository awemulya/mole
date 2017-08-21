import json
from channels import Group
from channels.auth import channel_session_user, channel_session_user_from_http
from userrole.models import UserRole 

@channel_session_user_from_http
def ws_connect(message):
    if message.user.id:
        message.reply_channel.send({"accept": True})
        group = UserRole.get_group(message.user.id)
        if group.name == "Super Admin":
            Group('super_admin').add(message.reply_channel)


        elif group.name == "Admin Assistant":
            Group('admin_assistant').add(message.reply_channel)

        elif group.name == "Office Head":
            Group('office_head').add(message.reply_channel)
            office = UserRole.get_office(message.user.id)
            Group('office-%s' % office.id).add(message.reply_channel)
            Group('office_head-%s' % office.id).add(message.reply_channel)

        elif group.name == "Information Officer":
            Group('info_officer').add(message.reply_channel)
            office = UserRole.get_office(message.user.id)
            Group('office-%s' % office.id).add(message.reply_channel)
            Group('info_officer-%s' % office.id).add(message.reply_channel)
        
        # Group('users').add(message.reply_channel)

        # Group('users').send({
        #     'text': json.dumps({
        #         'username': str(group),
        #         'is_logged_in': True
        #     })
        # })



@channel_session_user
def ws_disconnect(message):
    if message.user.id:
        group = UserRole.get_group(message.user.id)
        if group.name == "Super Admin":
            Group('super_admin').discard(message.reply_channel)

        elif group.name == "Admin Assistant":
            Group('admin_assistant').discard(message.reply_channel)

        elif group.name == "Office Head":
            Group('office_head').discard(message.reply_channel)
            office = UserRole.get_office(message.user.id)
            Group('office-%s' % office.id).discard(message.reply_channel)
            Group('office_head-%s' % office.id).discard(message.reply_channel)

        elif group.name == "Information Officer":
            Group('info_officer').discard(message.reply_channel)
            office = UserRole.get_office(message.user.id)
            Group('office-%s' % office.id).discard(message.reply_channel)
            Group('info_officer-%s' % office.id).discard(message.reply_channel)






    #    Group('users').send({
    #     'text': json.dumps({
    #         'username': message.user.username,
    #         'is_logged_in': True
    #     })
    # })