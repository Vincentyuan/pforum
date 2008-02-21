
from datetime import datetime

from pylons import config


def page_navigation(prefix, current, total, SIZE = 10, WIDTH = 5):
    #f = lambda x:'<a href="' + prefix + str(x) + '">' + str(x) + '</a>'
    prefix = config.get('app_prefix','') + prefix
    def f(x):
        if current == x:
            return '<li class="CurrentPage">' + str(x) + '</li>'
        else:
            return '<li><a href="' + prefix + str(x) + '">' + str(x) + '</a></li>'
    
    prev = current - 1
    next = current + 1
    
    seq = []
    
    if current == 1:
        seq.append('<li>&lt;</li>')
    else:
        seq.append('<li><a href="' + prefix + str(prev) + '">&lt;</a></li>')
    
    if total <= WIDTH:
        seq.extend([f(i) for i in range(1, total + 1)])
        #seq.append('<li>&gt;</li>')
        #return ' '.join(seq)
    
    else:
    
        HALF = WIDTH/2
        
        if current - HALF <= 1:
            seq.extend([f(i) for i in range(1, WIDTH)])
            seq.append('...')
            seq.append(f(total))
        elif current + HALF >= total:
            seq.append(f(1))
            seq.append('...')
            seq.extend([f(i) for i in range(total - WIDTH + 2, total + 1)])
        else:
            if WIDTH % 2 == 0:
                seq.append(f(1))
                seq.append('...')
                seq.extend([f(i) for i in range(current - HALF + 2, current + HALF)])
            else:
                seq.append(f(1))
                seq.append('...')
                seq.extend([f(i) for i in range(current - HALF + 1, current + HALF)])
            
            seq.append('...')
            seq.append(f(total))
            
    if current == total:
        seq.append('<li>&gt;</li>')
    else:
        seq.append('<li><a href="'+prefix+str(next)+'">&gt;</a></li>')

    return ' '.join(seq)


def page_range(page, count, SIZE = 10):
    total = count/SIZE + 1
    
    if page < 1:
        current = 1
    elif page > total:
        current = total
    else:
        current = page
    start = 1 + current * SIZE - SIZE
    if start > count:
        start = current * SIZE + 1
    
    if current * SIZE > count:
        end = count
    else:
        end = current * SIZE
    #print start,end, total,count
    return start, end, current, total

def howlong(d):
    r = datetime.today() - d
    if r.days > 1:
        return str(r.days) + ' days ago'
    if r.days == 1:
        return str(r.days) + ' day ago'
    if r.seconds > 7199:
        return str(r.seconds/3600) + ' hours ago'
    if r.seconds > 3599:
        return '1 hour ago'
    if r.seconds > 119:
        return str(r.seconds/60) + ' minutes ago'
    if r.seconds > 59:
        return '1 minute ago'
    if r.seconds > 1:
        return str(r.seconds) + ' seconds ago'
    if r.seconds > 0:
        return '1 second ago'


if __name__=='__main__':
    print page_navigation('/', 2, 4, 4)
    print page_navigation('/', 1, 5, 4)
    print page_navigation('/', 1, 6, 4)
    
    print page_navigation('/', 14, 15, 5)
    print page_navigation('/', 2, 15, 5)
    print page_navigation('/', 7, 15, 5)
    
    print page_navigation('/', 14, 15, 6)
    print page_navigation('/', 2, 15, 6)
    print page_navigation('/', 7, 15, 6)
    
    p=1
    print page_range(p,17)
    print page_range(-1,50)
    print page_range(1,20)
    print page_range(2,61)
    print page_range(3,57)