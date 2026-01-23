from django.shortcuts import render
from datetime import datetime
# from urllib import request  <-- ELIMINAR: No es necesaria y ensucia el namespace

def mostrar_anio(request):
    if request.method == 'POST':
        # Usamos 0 como default para evitar que int(None) lance excepción
        edad_str = request.POST.get('edad', '0') 
        try:
            edad = int(edad_str)
        except ValueError:
            edad = 0
            
        anio_actual = datetime.now().year
        anio_nacimiento = anio_actual - edad
        
        # Respuesta para cuando se envía el formulario
        return render(request, 'mostrarAnio.html', {'anio': anio_nacimiento})

    # Respuesta para el método GET (Carga inicial de la página)
    return render(request, 'mostrarAnio.html')