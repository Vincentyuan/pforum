import logging

from forum.lib.base import *

log = logging.getLogger(__name__)

class CommentsController(BaseController):

    def edit(self):
        return 'comments edit'
    
    def delete(self):
        return 'comments delete'
