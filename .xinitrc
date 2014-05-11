killall urxvtd
killall mpd
killall mpdscribble

xset -b
setxkbmap gb
urxvtd &
mpd
mpdscribble &
# syndaemon -k -i 0.5 -d
xscreensaver -no-splash &
# redshift-gtk &

xinput --map-to-output 12 LVDS1
# xcape -e "Shift_L=parenleft;Shift_R=parenright"
randomwp &
exec src/stumpwm/stumpwm &> .log
