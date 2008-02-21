import logging
import md5

from forum.lib.base import *
from forum.model import Session

import formencode
from formencode import validators

log = logging.getLogger(__name__)

'''
class UniqueUsername(formencode.FancyValidator):
    usernames = []
    def _to_python(self, value, state):
        if value in self.usernames:
            raise formencode.Invalid(
                'That username already exists',
                value, state)
        return value

class SecurePassword(formencode.FancyValidator):
    words_filename = '/usr/share/dict/words'
    def _to_python(self, value, state):
        f = open(self.words_filename)
        lower = value.strip().lower()
        for line in f:
            if line.strip().lower() == lower:
                raise formencode.Invalid(
                    'Please do not base your password on a '
                    'dictionary term', value, state)
        return value
'''


class SignupForm(formencode.Schema):
    username = validators.PlainText()
    password = validators.String()
    password2 = validators.String()
    email = validators.Email(resolve_domain=False)
    chained_validators = [validators.FieldsMatch('password', 'password2')]


class LoginForm(formencode.Schema):
    username = validators.PlainText(not_empty=True)
    password = validators.PlainText(not_empty=True)


class AccountController(BaseController):

    def index(self):
        # Return a rendered template
        #   return render('/some/template.mako')
        # or, Return a response
        
        return self.login()

    def login(self):
        if request.method == 'GET':
            return render('genshi','login')
        else:
            schema = LoginForm()
            #log.debug('%s',dir(schema))
            
            try:
                form_result = schema.to_python(request.params)
                
            except formencode.Invalid, error:
                return 'Invalid: %s' % error
            else:
                #log.debug('%s',request.POST['username'])
                #log.debug('%s',request.POST['password'])
                
                #look up in db for the username
                db = Session()
                result = db.execute('select * from LUM_User where Name=%s',form_result.get('username'))
                user_info = result.fetchone()
                
                if not user_info:
                    c.err = 'user not exist'
                    return 'login failed'
                
                log.debug('%s',user_info)
                
                if md5.md5(form_result.get('password')).hexdigest() == user_info[7]:
                    #write session
                    session['user_id'] = user_info[0]
                    session['name'] = form_result.get('username')
                    session.save()
                    #return 'login success'
                    return redirect_to(controller='topics',action='index')
                else:
                    c.err = 'err'
                    return render('genshi','login')
                
                
    def logout(self):
        #remove session
        if session.has_key('user_id') and session.has_key('name'):
            del session['user_id']
            del session['name']
            session.save()
        
        #return render('genshi','logout')    
        return redirect_to(controller='topics',action='index')

    def signup(self):
        if request.method == 'GET':
            return render('genshi','signup')
        else:
            schema = SignupForm()
            try:
                form_result = schema.to_python(request.params)
                
            except formencode.Invalid, error:
                return 'Invalid: %s' % error
            else:
                #insert to db
                db = Session()
                
                result = db.execute('select * from users where name=? or email=?',(form_result.get('username'),form_result.get('email')))
                user_info = result.fetchone()
                #log.debug('%s',user_info)
                if user_info:
                    return 'username or email exists'
                
                db.execute('insert into users (name,password,email) values(?,?,?)',(form_result.get('username'),form_result.get('password'),form_result.get('email')))
                Session.commit()
                
                result = db.execute('select * from users where name=? and password=? and email=?',(form_result.get('username'),form_result.get('password'),form_result.get('email')))
                user_info = result.fetchone()
                if not user_info:
                    return 'db failed'
                user_id = user_info[0]
                
                session['user_id']=user_id
                session['name']=form_result.get('username')
                session.save()
                return 'signup success'

