from django.shortcuts import render

# Create your views here.
def existe_lista(request):
    elementos = ['lengua', 'banana', 'vaca']
    if(request.method == 'POST'): 
        asignatura = request.POST('nombre')
        return render(request, 'formularioAsignatura.html', {'asignatura': asignatura, 'elementos': elementos})
    else:
        return render(request, 'formularioAsignatura.html')

