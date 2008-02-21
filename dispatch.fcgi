#!/home/kernel1983/bin/python
import sys

#sys.stderr = open('err.log','w')
#sys.path += ['/home/jcroft/django/django_src']

sys.path += ['/home/kernel1983/www.djangocn.com']
sys.path += ['/home/kernel1983/www.djangocn.com/forum']
sys.path += ['/home/kernel1983/www.djangocn.com/forum/forum']

# Load the WSGI application from the config file
from paste.deploy import loadapp
wsgi_app = loadapp('config:/home/kernel1983/www.djangocn.com/forum/test.ini')

# Deploy it using FastCGI
if __name__ == '__main__':
    from flup.server.fcgi import WSGIServer
    WSGIServer(wsgi_app).run()
