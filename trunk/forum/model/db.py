from sqlalchemy import *
import os
from datetime import datetime


def setup_scheme(conn):
    conn.execute('create table test ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        't TEXT)')

    conn.execute('create table categories ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'title TEXT, '
        'description TEXT, '
        'idx INTEGER, '
        'last_update_user, '
        'last_update_topic, '
        'last_update_datetime TEXT)'
        )

    conn.execute('create table topics ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'category_id INTEGER, '
        'title TEXT, '
        'content TEXT, '
        'post_datetime TEXT, '
        'mod_datetime TEXT)'
        )

    conn.execute('create table comments ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'topic_id INTEGER, '
        'user_id INTEGER, '
        'comment TEXT, '
        'post_datetime TEXT)'
        )

    conn.execute('create table users ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'password TEXT, '
        'email TEXT, '
        'last_login_datetime TEXT)'
        )

    conn.execute('create table roles ('
        'id INTEGER PRIMARY KEY AUTOINCREMENT, '
        'name TEXT, '
        'permission TEXT, '
        'access TEXT)'
        )


if __name__=='__main__':
    os.remove('database')

    engine = create_engine('sqlite:///database')
    #for i in dir(engine):print i
    conn = engine.connect()

    setup_scheme(conn)

    print datetime.now()
    conn.execute('insert into test (t) values (?)', datetime.now())
    #conn.execute('insert into test values (?,?)',None, u'kern')



    '''
    result = conn.execute('select * from sqlite_master')
    for i in result:
        print i
    '''

    conn.execute('insert into categories (title) values("default category")')

    result = conn.execute('select * from categories where title="default category"')
    #for i in result: print i
    #print dir(result)
    row = result.fetchone()
    if row:
        print row[0]
        conn.execute('insert into topics (title, category_id,content) values("topic1",?,?)',row[0],'my content')
        conn.execute('insert into topics (title, category_id,content) values("topic2",?,"my content2")',row[0])


    result = conn.execute('select * from topics')
    for i in result: print i


    #conn.execute('drop table test')


    conn.close()
