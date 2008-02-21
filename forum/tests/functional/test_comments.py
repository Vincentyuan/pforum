from forum.tests import *

class TestCommentsController(TestController):

    def test_index(self):
        response = self.app.get(url_for(controller='comments'))
        # Test response...
