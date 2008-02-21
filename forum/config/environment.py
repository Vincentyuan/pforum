"""Pylons environment configuration"""
import os
import sys

from pylons import config

import forum.lib.app_globals as app_globals
import forum.lib.helpers
from forum.config.routing import make_map

def load_environment(global_conf, app_conf):
    """Configure the Pylons environment via the ``pylons.config``
    object
    """
    # Pylons paths
    root = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    paths = dict(root=root,
                 controllers=os.path.join(root, 'controllers'),
                 static_files=os.path.join(root, 'public'),
                 templates=[os.path.join(root, 'templates')])

    # Initialize config with the basic options
    config.init_app(global_conf, app_conf, package='forum',
                    template_engine='mako', paths=paths)

    config['routes.map'] = make_map()
    config['pylons.g'] = app_globals.Globals()
    config['pylons.h'] = forum.lib.helpers

    # Customize templating options via this variable
    tmpl_options = config['buffet.template_options']
    #tmpl_options['mako.output_encoding'] = 'utf-8'
    #tmpl_options['genshi.output_encoding'] = 'utf-8'

    # CONFIGURATION OPTIONS HERE (note: all config options will override
    # any Pylons config options)
    
    config.add_template_engine('genshi', 'forum.templates', {})
    #config['pylons.response_options']['charset'] = 'utf-8'
    #config['pylons.request_options']['charset'] = 'utf-8'
    
    reload(sys)
    sys.setdefaultencoding('utf-8')
