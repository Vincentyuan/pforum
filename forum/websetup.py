"""Setup the forum application"""
import logging

from paste.deploy import appconfig
from pylons import config

from forum.config.environment import load_environment

log = logging.getLogger(__name__)

def setup_config(command, filename, section, vars):
    """Place any commands to setup forum here"""
    conf = appconfig('config:' + filename)
    load_environment(conf.global_conf, conf.local_conf)

    '''
    import forum.model as model
    connection = model.engine.connect()
    model.setup_scheme(connection)
    '''