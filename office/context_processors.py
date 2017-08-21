from office.models import District, Office


def dcms_data(request):
    return {
        'districts': District.objects.all(),
        'projectlinks': Office.objects.filter(is_project=True),
    }
