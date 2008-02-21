"""Routes configuration

The more specific and detailed routes should be defined first so they
may take precedent over the more generic routes. For more information
refer to the routes manual at http://routes.groovie.org/docs/
"""
from pylons import config
from routes import Mapper

def make_map():
    """Create, configure and return the routes Mapper"""
    map = Mapper(directory=config['pylons.paths']['controllers'],
                 always_scan=config['debug'], explicit=True)
    
    # The ErrorController route (handles 404/500 error pages); it should
    # likely stay at the top, ensuring it can always be resolved
    map.connect('error/:action/:id', controller='error')
    
    # CUSTOM ROUTES HERE
    
    map.connect('categories',controller='categories',action='index')
    map.connect('categories/post',controller='categories',action='post')
    map.connect('categories/:category_id/post',controller='categories',action='post',requirements=dict(category_id='\d+'))
    map.connect('categories/:category_id/:categroy_page',controller='categories',action='view',category_id=0,categroy_page=1,requirements=dict(category_id='\d+',categroy_page='\d+'))
    
    map.connect('topics/:id/:topic_page',controller='topics',action='view',id=0,topic_page=1,requirements=dict(id='\d+',topic_page='\d+'))
    map.connect('topics/:id/edit',controller='topics',action='edit',requirements=dict(id='\d+'))
    map.connect('topics/:id/delete',controller='topics',action='delete',requirements=dict(id='\d+'))
    map.connect('topics/:id/comment',controller='topics',action='comment',requirements=dict(id='\d+'))
    
    map.connect('comments/:comment_id/edit',controller='comments',action='edit',requirements=dict(id='\d+'))
    map.connect('comments/:comment_id/delete',controller='comments',action='delete',requirements=dict(id='\d+'))
    
    map.connect('search',controller='search',action='index')
    
    map.connect('account/:action',controller='account')
    
    map.connect('test_genshi',controller='test_genshi',action='index')
    map.connect('test_plain',controller='test_genshi',action='plain')
    
    #map.connect('',controller='topics',action='index',page=1)
    #map.connect('topics',controller='topics',action='index',page=1)
    map.connect(':page',controller='topics',action='index',page=1,requirements=dict(page='\d+'))
    map.connect(':prefix/:page',controller='topics',action='index',prefix=config.get('app_prefix',''),page=1,requirements=dict(page='\d+'))
    #map.connect('topics/:id',controller='topics',action='view',id='0',requirements=dict(id='\d+'))
    
    map.connect('*url', controller='template', action='view')
    
    return map
