from forum.tests import *

class TestTopicsController(TestController):

    def test_index(self):
        response = self.app.get(url_for(controller='topics'))
        # Test response...
