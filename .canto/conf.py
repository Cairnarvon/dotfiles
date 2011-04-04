import os
from canto.extra import *

if os.getenv("TERM") == "linux":
    link_handler('elinks "%u"', text=True)
else:
    link_handler('google-chrome "%u"')
    image_handler('google-chrome "%u"')
    select_hook = set_xterm_title
    end_hook = clear_xterm_title

filters=[show_unread, None]

keys['1'] = set_filter(show_unread)
keys['2'] = set_filter(None)
keys['/'] = search_filter
keys['y'] = yank

reader_keys['w'] = wget_link("/home/cairnarvon/wgotten")

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
add("http://mai.rotahall.org/?feed=rss2",       tags=["Maia", "Rota Hall"])
add("http://www.mcgilleus.ca/blog/11/feed",     tags=["Maia", "Rota Hall"])
add("http://coren.rotahall.org/?feed=rss2",     tags=[None, "Rota Hall"])
add("http://saythings.rotahall.org/?feed=rss2", tags=[None, "Rota Hall"])
add("http://ninja.rotahall.org/?feed=rss2",     tags=[None, "Rota Hall"])
add("http://qow.rotahall.org/?feed=rss2",       tags=[None, "Rota Hall"])

# RL
add("http://menoname.wordpress.com/feed/")
add("http://blog.associatie.kuleuven.be/tinekemps/feed/")

# Pharyngula and #pharyngula
add("http://scienceblogs.com/pharyngula/index.xml")
add("http://scienceonlooker.blogspot.com/rss.xml", tags=["cactaur"])
add("http://missivesfromthefrontallobe.blogspot.com/feeds/posts/default?alt=rss",
    tags=["klbadger"])
add("http://wockets.org/?feed=rss", tags=["Nerull"])
add("http://greedygreedyalgorithms.blogspot.com/feeds/posts/default?alt=rss")

# Other ScienceBlogs and science blogs and things
add("http://scienceblogs.com/erv/index.xml")
add("http://whyevolutionistrue.wordpress.com/feed/")
add("http://scienceblogs.com/deltoid/index.xml")
add("http://scienceblogs.com/tetrapodzoology/index.xml")
add("http://www.badscience.net/feed/")

# /prog/ and related
add("http://chrisdone.com/rss.xml",             tags=[None, "/prog/"])
add("http://blog.desudesudesu.org/?feed=rss2",  tags=[None, "/prog/"])
add("http://j.rigelseven.com/rsst.xml",         tags=[None, "/prog/"])
add("http://leahculver.com/feed/",              tags=[None, "/prog/"])
add("http://collison.ie/blog/feed",             tags=[None, "/prog/"])
add("http://feeds.feedburner.com/AngrySummerQuietFall", tags=["Shii"])

# Misc. Internets
add("http://blog.myspace.com/blog/rss.cfm?friendID=18382968", tags=["Laura"])
add("http://alterisego.wordpress.com/feed/")
add("http://feeds.feedburner.com/andyfreeland")
add("http://twicemice.com/feed/")
add("http://headinjurytheater.blogspot.com/feeds/posts/default?alt=rss")

# Local politics
add("http://yelloman1.blogspot.com/feeds/posts/default?alt=rss")
add("http://www.kosmopolito.org/feed/")

# I guess math and computers and things
add("http://scienceblogs.com/goodmath/index.xml")
add("http://pentadecathlon.com/lifeNews/index.xml")
add("http://feeds.feedburner.com/lbrandy")
add("http://feeds.feedburner.com/schneier/fulltext")
add("http://rijmenants.blogspot.com/feeds/posts/default?alt=rss")

# People still make webcomics for some reason
add("http://www.rsspect.com/rss/qwantz.xml")
add("http://www.smbc-comics.com/rss.php")
add("http://oglaf.com/feeds/rss/")

# Misc.
add("http://www.languagehat.com/index.rdf")
add("http://feeds.arstechnica.com/arstechnica/BAaf")
add("http://richarddawkins.net/feed.php")
