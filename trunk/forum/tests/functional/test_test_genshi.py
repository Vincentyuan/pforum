from forum.tests import *

class TestTestGenshiController(TestController):

    def test_index(self):
        response = self.app.get(url_for(controller='test_genshi'))
        # Test response...
