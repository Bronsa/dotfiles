killall urxvtd
killall mpd
killall mpdas

xset -b
setxkbmap gb
urxvtd &
mpd
mpdas -c .mpdasrc -d
# syndaemon -k -i 0.5 -d
xscreensaver -no-splash &
# redshift-gtk &

xinput --map-to-output 12 LVDS1
# xcape -e "Shift_L=parenleft;Shift_R=parenright"
while true; do randomwp; sleep 5m; done &
exec src/stumpwm/stumpwm &> .log
