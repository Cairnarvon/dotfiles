import os
from canto.extra import *

if os.getenv("TERM") == "linux":
    link_handler('www-browser "%u"', text=True)
else:
    link_handler('x-www-browser "%u"')
    image_handler('x-www-browser "%u"')
    select_hook = set_xterm_title
    end_hook = clear_xterm_title

filters=[show_unread, None]

keys['1'] = set_filter(show_unread)
keys['2'] = set_filter(None)
keys['/'] = search_filter
keys['y'] = yank

reader_keys['w'] = wget_link("%s/wgotten" % os.getenv("HOME"))

def resize_hook(cfg):
    cfg.reader_orientation = "right"
    cfg.reader_lines = cfg.width * 31 / 50

default_tag_sorts([by_date])

never_discard("unread")
never_discard("Rota Hall")
never_discard("/prog/")

default_rate(60)

# Rota Hall
add("http://cairnarvon.rotahall.org/feed/",     tags=[None, "Rota Hall"])
add("http://terras.rotahall.org/?feed=rss2",    tags=[None, "Rota Hall"])
add("http://mjfreeze.tumblr.com/rss",           tags=[None, "Rota Hall"])
add("http://coren.rotahall.org/?feed=rss2",     tags=[None, "Rota Hall"])

# ScienceBlogs and science blogs and things
add("http://feeds.feedburner.com/freethoughtblogs/pharyngula")
add("http://freethoughtblogs.com/brutereason/feed/")

# /prog/ and related
add("http://chrisdone.com/rss.xml",             tags=[None, "/prog/"])
add("http://blog.desudesudesu.org/?feed=rss2",  tags=[None, "/prog/"])
add("http://j.rigelseven.com/rsst.xml",         tags=[None, "/prog/"])
add("http://blog.leahculver.com/rss.xml",       tags=[None, "/prog/"])

# Misc. Internets
add("http://alterisego.wordpress.com/feed/")
add("http://feeds.feedburner.com/andyfreeland")
add("http://headinjurytheater.blogspot.com/feeds/posts/default?alt=rss")

# Local politics
add("http://yelloman1.blogspot.com/feeds/posts/default?alt=rss")

# I guess math and computers and things
add("http://scienceblogs.com/goodmath/index.xml")
add("http://pentadecathlon.com/lifeNews/index.xml")
add("http://feeds.feedburner.com/lbrandy")
add("http://feeds.feedburner.com/schneier/fulltext")

# People still make webcomics for some reason
add("http://www.rsspect.com/rss/qwantz.xml")
add("http://oglaf.com/feeds/rss/")
add("http://awkwardzombie.com/awkward.php")
add("http://www.hejibits.com/feed/")
add("http://www.rsspect.com/rss/vagrant.xml")

# Misc.
add("http://feeds.arstechnica.com/arstechnica/BAaf")
