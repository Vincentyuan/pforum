from sqlalchemy import create_engine
from sqlalchemy.orm import scoped_session, sessionmaker
from pylons import config

from db import setup_scheme

engine = create_engine(config['sqlalchemy.default.url'])
#connection = engine.connect()

Session = scoped_session(sessionmaker(autoflush=True, transactional=True, bind=engine))
