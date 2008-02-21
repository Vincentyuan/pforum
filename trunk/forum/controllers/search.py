import logging

from forum.lib.base import *

log = logging.getLogger(__name__)

class SearchController(BaseController):

    def index(self):
        # Return a rendered template
        #   return render('/some/template.mako')
        # or, Return a response
        return 'Search'
        
