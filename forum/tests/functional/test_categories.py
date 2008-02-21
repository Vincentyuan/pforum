from forum.tests import *

class TestCategoriesController(TestController):

    def test_index(self):
        response = self.app.get(url_for(controller='categories'))
        # Test response...
