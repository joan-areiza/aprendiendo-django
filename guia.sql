Guía Técnica de Configuración y Desarrollo con Django

Esta guía documenta el flujo de trabajo estándar para la creación, configuración y ejecución de un proyecto en Django, incluyendo la configuración del entorno virtual, la instalación de dependencias, la creación de aplicaciones, el manejo de migraciones y la puesta en marcha del servidor.

1. Configuración del Entorno Virtual

Es fundamental aislar las dependencias del proyecto creando un entorno virtual antes de instalar librerías.

Crear el entorno virtual:

python -m venv venv


Activar el entorno virtual:

En Linux / macOS:

source venv/bin/activate


En Windows:

venv\Scripts\activate


2. Instalación de Dependencias y Herramientas

Instale las librerías necesarias para el proyecto utilizando pip:

Instalar paquetes en Python:

pip install django
pip install django-ckeditor
pip install Pillow


Herramientas de desarrollo recomendadas:

Extensión Pylint (en VS Code o IDE de preferencia) para el análisis de código.

DB Browser for SQLite para la inspección y gestión visual de la base de datos db.sqlite3.

3. Creación e Invocación del Proyecto Django

Navegue al directorio de trabajo e inicie la estructura base del proyecto:

Navegar a la carpeta de trabajo:

cd /opt/lampp/htdocs/ADSO-PYTHON/22-django/


Crear el proyecto Django:

django-admin startproject AprendiendoDjango


Acceder al directorio del proyecto:

cd AprendiendoDjango


4. Creación y Registro de Aplicaciones (Apps)

Los proyectos de Django se estructuran mediante módulos o aplicaciones independientes.

Crear una nueva aplicación:

python manage.py startapp miapp


Registrar la aplicación en el proyecto:
Abre el archivo AprendiendoDjango/settings.py e incluye el nombre de la aplicación dentro de la lista INSTALLED_APPS:

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    # Aplicaciones instaladas de terceros
    'ckeditor',
    # Mis aplicaciones
    'miapp',
]


5. Estructura de Vistas, URLs y Plantillas (Templates)

a. Estructura de Plantillas

Cree la estructura de carpetas dentro de la aplicación para gestionar la herencia de plantillas:

miapp/
└── templates/
    └── layouts/
        └── layout.html
    └── miapp/
        └── index.html


b. Definición de Vistas (miapp/views.py)

from django.shortcuts import render

def index(request):
    return render(request, 'miapp/index.html', {
        'title': 'Inicio'
    })


c. Configuración de Rutas (AprendiendoDjango/urls.py)

from django.contrib import admin
from django.urls import path
from miapp import views

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', views.index, name='index'),
]


6. Modelos y Gestión de Base de Datos

Generar los archivos de migración (tras crear o modificar modelos en models.py):

python manage.py makemigrations


Aplicar las migraciones a la base de datos:
(Nota: El comando correcto es migrate, no migration)

python manage.py migrate


7. Panel de Administración y Autenticación

Crear un superusuario (Administrador):

python manage.py createsuperuser


(Proporcione el nombre de usuario, correo electrónico y contraseña requeridos).

Registrar modelos en el Admin (miapp/admin.py):

from django.contrib import admin
from .models import MiModelo

admin.site.register(MiModelo)


8. Ejecución del Servidor de Desarrollo

Inicie el servidor local para verificar el correcto funcionamiento del proyecto:

python manage.py runserver


Una vez iniciado, acceda desde su navegador web a:

Página principal: http://127.0.0.1:8000/

Panel de administración: http://127.0.0.1:8000/admin/
