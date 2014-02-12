killall urxvtd
killall mpd
killall mpdscribble

xrdb -merge ~/.Xresources
xset -b
setxkbmap gb
urxvtd &
mpd
mpdscribble &
syndaemon -k -i 0.5 -d
 xscreensaver -no-splash &
redshift -o -l 0:0 -b 0.8 -t 6500:6500
xinput --map-to-output 12 LVDS1
# xcape -e "Shift_L=parenleft;Shift_R=parenright"
feh --bg-fill Images/13806869061491.jpg
exec src/stumpwm/stumpwm &> .log
