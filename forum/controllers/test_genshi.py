import logging

from forum.lib.base import *

log = logging.getLogger(__name__)

class TestGenshiController(BaseController):

    def index(self):
        # Return a rendered template
        #   return render('/some/template.mako')
        # or, Return a response
        c.pylons_paths_controller = config['pylons.paths']['controllers']
        c.request = str(request)
        return render('genshi','test_genshi')

    def plain(self):
        return '<img src="http://media.djangoproject.com/img/site/hdr_logo.gif" />'

