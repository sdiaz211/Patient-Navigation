from django.shortcuts import render

from .models import Study, Patient, Sample, Aliquot, Test, Plot1, Plot2, Plot3
# Create your views here.
def studies(request):
    study = Study.objects.all()
    return render(request, 'studies.html', {'study':study})


def patients(request):
    patient = Patient.objects.all()
    return render(request, 'patients.html', {'patient':patient})

def samples(request):
    sample = Sample.objects.all()
    return render(request, 'samples.html', {'sample': sample})

def aliquots(request):
    aliquot = Aliquot.objects.all()
    return render(request, 'aliquots.html', {'aliquot':aliquot})

def tests(request):
    test = Test.objects.all()
    return render(request, 'tests.html', {'test':test})

def plots(request):
    plot1= Plot1.objects.all()
    plot2= Plot2.objects.all()
    plot3= Plot3.objects.all()

    context = {
        'age1': [p.age for p in plot1],
        'zonulin1': [p.data for p in plot1],
        'id1': plot1[0].study_id,
        'age2': [p.age for p in plot2],
        'zonulin2': [p.data for p in plot2],
        'id2': plot2[0].study_id,
        'age3': [p.age for p in plot3],
        'zonulin3': [p.data for p in plot3],
        'id3': plot3[0].study_id
    }
    return render(request, 'plots.html', context)
