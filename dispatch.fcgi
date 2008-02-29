#!/usr/env python
# this is an example on dreamhost
import sys

#sys.stderr = open('err.log','w')
#sys.path += ['/path/to/django_src']

sys.path += ['~/www.mysite.com']
sys.path += ['~/www.mysite.com/pforum']
sys.path += ['~/www.mysite.com/pforum/forum']

# Load the WSGI application from the config file
from paste.deploy import loadapp
wsgi_app = loadapp('config:~/www.mysite.com/pforum/test.ini')

# Deploy it using FastCGI
if __name__ == '__main__':
    from flup.server.fcgi import WSGIServer
    WSGIServer(wsgi_app).run()
