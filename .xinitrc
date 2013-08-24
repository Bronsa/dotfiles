killall urxvtd
killall mpd
killall mpdscribble

xset -b
setxkbmap gb
urxvtd &
mpd
mpdscribble &
syndaemon -t -k -i 2 -d &
xscreensaver -no-splash &
redshift -o -l 0:0 -b 0.8 -t 6500:6500
xinput --map-to-output 12 LVDS1
exec src/stumpwm/stumpwm &> .log
