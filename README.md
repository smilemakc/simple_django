# simple_django
Docker image for Django project

**Python packages**

contextlib2==0.5.5 
decorator==4.0.11 
Django==1.11.3 
django-ckeditor==5.3.0 
django-environ==0.4.3 
django-extra-fields==0.9 
django-js-asset==0.1.1 
django-model-utils==3.0.0 
django-solo==1.1.2 
django-suit==0.2.25 
django-test-plus==1.0.18 
elizabeth==0.4.0 
gevent==1.2.2 
greenlet==0.4.12 
gunicorn==19.7.1 
ipython==6.1.0 
ipython-genutils==0.2.0 
jedi==0.10.2 
olefile==0.44 
pexpect==4.2.1 
pickleshare==0.7.4 
Pillow==4.2.0 
prompt-toolkit==1.0.14 
psycopg2==2.7.1 
ptyprocess==0.5.2 
Pygments==2.2.0 
pytz==2017.2 
raven==6.1.0 
simplegeneric==0.8.1 
six==1.10.0 
traitlets==4.3.2 
wcwidth==0.1.7

## Usage

**Dockerfile**

add your requirements.txt to build context


```
   FROM smilemakc/simple_django:latest
   RUN pip install -r requirements.txt
   
```


**docker-compose**


```
services:
    django:
      image: smilemakc/simple_django:latest
      volumes:
        - .:/code
      ports:
        - "8000:8000"
```
