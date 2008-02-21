from pylons import session

def alive():
    if session.has_key('user_id') and session.has_key('name'):
        return True
    else:
        return False
