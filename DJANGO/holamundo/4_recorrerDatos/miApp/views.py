from django.shortcuts import render


# Create your views here.
def recorer_datos(request):
    datos = [
        {"nombre": "Juan", "edad": 28},
    ]
    return render(request, "lista_alumnos.html", {"datos": datos})
