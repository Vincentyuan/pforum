import logging
from datetime import datetime

from forum.lib.base import *
from forum.lib.user import alive
from forum.model import Session

log = logging.getLogger(__name__)

import formencode
from formencode import validators

from forum.lib.pages import page_range

class CommentForm(formencode.Schema):
    Body = validators.String(not_empty=True)
    allow_extra_fields=True


class TopicsController(BaseController):

    def index(self,page):
        # Return a rendered template
        #   return render('/some/template.mako')
        # or, Return a response
        
        db = Session()
        c.alive = alive()
        
        result = db.execute('select count(*) from LUM_Discussion')
        c.topics_total = result.fetchone()[0]
        c.topics_start, c.topics_end, c.pages_current, c.pages_total = page_range(int(page), c.topics_total)
        log.debug('input_page:%s topics_total:%s start:%s end:%s pages_current:%s , pages_total:%s',page,c.topics_total,c.topics_start, c.topics_end, c.pages_current, c.pages_total)
        
        position = c.topics_start - 1
        length = c.topics_end - position
        
        result = db.execute('select d.DiscussionID,d.Name,c.Name,u1.Name,u2.Name,d.CountComments,d.DateLastActive from LUM_Discussion AS d Left Join (LUM_User AS u1) on (d.AuthUserID=u1.UserID) Left Join (LUM_User AS u2) on (d.LastUserID=u2.UserID),LUM_Category AS c where d.CategoryID=c.CategoryID order by d.DateLastActive desc LIMIT %s,%s',(position,length))
        c.topics = result.fetchall()
        
        return render('genshi','topics')
    
    def view(self,id):
        db = Session()
        c.alive = alive()
        
        log.debug('topic %s',id)
        result = db.execute('select * from LUM_Discussion,LUM_Category where LUM_Discussion.CategoryID = LUM_Category.CategoryID and LUM_Discussion.DiscussionID=%s',id)
        if result.rowcount != 1:
            return 'err'
        c.topic = result.fetchone()
        
        result = db.execute('select * from LUM_Comment,LUM_User where LUM_User.UserID=LUM_Comment.AuthUserID and LUM_Comment.DiscussionID=%s order by LUM_Comment.CommentID asc',id)
        c.comments = result.fetchall()
        
        return render('genshi','topic')
    
    def edit(self):
        return 'topics edit'
    
    def delete(self):
        return 'topics delete'
    
    def comment(self,id):
        
        log.debug('comment')
        if alive() and request.method == 'POST':
            #vaild form
            db = Session()
            db.execute('insert into LUM_Comment (DiscussionID, AuthUserID, Body) values(%s,%s,%s)',(str(id), session['user_id'], request.POST['Body'].encode('utf-8')))
            db.execute('update LUM_Discussion set CountComments = (select count(*) from LUM_Comment where DiscussionID=%s),LastUserID=%s,DateLastActive=%s where DiscussionID=%s', (str(id),session['user_id'],datetime.now(), str(id)))
            Session.commit()
            log.debug('comment submit')
        
        return redirect_to(controller='topics',action='view',id=id)

