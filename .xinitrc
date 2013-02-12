setxkbmap it
killall urxvtd
urxvtd &
mpd ~/.mpdconf
exec src/stumpwm/stumpwm
