import logging
from datetime import datetime

from forum.lib.base import *
from forum.lib.user import alive
from forum.model import Session

log = logging.getLogger(__name__)

import formencode
from formencode import validators

from forum.lib.pages import page_range

class PostForm(formencode.Schema):
    #category_id = validators.Int(not_empty=True)
    CategoryID = validators.Int(not_empty=True)
    #title = validators.String(not_empty=True)
    Name = validators.String(not_empty=True)
    WhisperUsername = validators.String()
    Body = validators.String(not_empty=True)
    allow_extra_fields=True


class CategoriesController(BaseController):

    def index(self):
        # Return a rendered template
        #   return render('/some/template.mako')
        # or, Return a response
        
        db = Session()
        c.alive = alive()
        
        result = db.execute('select * from LUM_Category')
        c.categories = result.fetchall()
        
        return render('genshi','categories')

    def view(self,category_id, categroy_page):
        db = Session()
        c.alive = alive()
        
        result = db.execute('select count(*) from LUM_Discussion where CategoryID=%s', category_id)
        c.topics_total = result.fetchone()[0]
        
        c.topics_start, c.topics_end, c.pages_current, c.pages_total = page_range(int(categroy_page), c.topics_total)
        log.debug('topics_total:%s start:%s end:%s',c.topics_total,c.topics_start, c.topics_end)
        
        position = c.topics_start - 1
        length = c.topics_end - position
        
        #category title
        result = db.execute('select * from LUM_Category where CategoryID=%s',int(category_id))
        c.category = result.fetchone()
        
        #topics
        #result = db.execute('select * from LUM_Discussion order by DiscussionID desc')
        result = db.execute('select d.DiscussionID,d.Name,c.Name,u1.Name,u2.Name,d.CountComments,d.DateLastActive from LUM_Discussion AS d Left Join (LUM_User AS u1) on (d.AuthUserID=u1.UserID) Left Join (LUM_User AS u2) on (d.LastUserID=u2.UserID),LUM_Category AS c where d.CategoryID=c.CategoryID and d.CategoryID=%s order by d.DateLastActive desc LIMIT %s,%s',(int(category_id),position,length))
        c.topics = result.fetchall()
        
        return render('genshi','category')

    def post(self,category_id=0):
        c.alive = alive()
        if not c.alive:
            return redirect_to(controller='topics',action='index',category_id=None)
        
        db = Session()
        
        if request.method == 'POST':
            #valid the form
            schema = PostForm()
            
            try:
                form_result = schema.to_python(request.params)
            except formencode.Invalid, error:
                return 'Invalid: %s' % error
            else:
                db.execute('insert into LUM_Discussion (Name,CategoryID,DateCreated,DateLastActive,AuthUserID,LastUserID) values(%s,%s,%s,%s,%s,%s)',
                            (form_result.get('Name').encode('utf-8'),form_result.get('CategoryID'),datetime.now(),datetime.now(),session['user_id'],session['user_id']))
                
                result = db.execute('select * from LUM_Discussion order by DiscussionID desc')
                discussion_id = result.fetchone()[0]
                
                #add topic content
                db.execute('insert into LUM_Comment (Body,DiscussionID,DateCreated,AuthUserID) values(%s,%s,%s,%s)',
                            (form_result.get('Body').encode('utf-8'),discussion_id,datetime.now(),session['user_id']))
                
                Session.commit()
                log.debug('post submit')
                return redirect_to(controller='categories', action='view', category_id=form_result.get('CategoryID'))
        
        c.category_id = int(category_id)
        
        result = db.execute('select * from LUM_Category')
        c.categories = result.fetchall()
        
        return render('genshi','post')

