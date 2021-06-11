import gtk
from subprocess import check_output, call
#import subprocess
import os


def open(data=None):
  #  running=call("ps cax | grep -w spotify", shell=True)
  running = check_output ("ps -A | awk '/thunderbird/{print \"alive\";exit}'", shell=True)
  # print running
  
  if "alive" not in running:
    os.system("thunderbird &")
    call("i3-msg \"[class=\"Thunderbird\"] move window to scratchpad, scratchpad show\"", shell=True)
  else:
    call("i3-msg \"[class=\"Thunderbird\"] scratchpad show\"", shell=True)
  
def open_app(data=None):
  open()

def close_app(data=None):
  call("killall thunderbird", shell=True)
  gtk.main_quit()

def make_menu(event_button, event_time, data=None):
  menu = gtk.Menu()
  open_item = gtk.MenuItem("Open")
  close_item = gtk.MenuItem("Close")

  #Append the menu items
  #menu.append(open_item)
  menu.append(close_item)
  #add callbacks
  #open_item.connect_object("activate", open_app, "Open")
  close_item.connect_object("activate", close_app, "Close")
  #Show the menu items
  #open_item.show()
  close_item.show()

  #Popup the menu
  menu.popup(None, None, None, event_button, event_time)

def on_right_click(data, event_button, event_time):
  make_menu(event_button, event_time)

def on_left_click(event):
  open()
   # call("i3-msg \"[class=\"Spotify\"] scratchpad show\"", shell=True)


if __name__ == '__main__':
  #icon = gtk.status_icon_new_from_stock(gtk.STOCK_ABOUT)
#  icon = gtk.status_icon_new_from_file("/usr/share/icons/Numix-Circle/48/apps/thunderbird.svg");
  icon = gtk.status_icon_new_from_file("/usr/share/icons/hicolor/48x48/apps/thunderbird.png");
  icon.connect('popup-menu', on_right_click)
  icon.connect('activate', on_left_click)
gtk.main()
