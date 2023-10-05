from schedule import repeat, every, run_pending
from webbrowser import open
import time
ZOOM_LINK = "https://ubc.zoom.us/j/67524465044?pwd=Nld4L09Ya3R0QU9wcGdHM0xRYUEvZz09&uname=Zain+Ali"

@repeat(every().tuesday.at("09:15"), link=ZOOM_LINK)
@repeat(every().thursday.at("09:15"), link=ZOOM_LINK)
def join_zoom_meeting(link):
    open(link)


while True:
    run_pending()
    time.sleep(1)