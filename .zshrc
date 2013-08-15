export TERM="xterm-256color"

# azzoppati {{{
[ -s "${ZDOTDIR:-$HOME}/.zoppo/zoppo.zsh" ] && source "${ZDOTDIR:-$HOME}/.zoppo/zoppo.zsh"
# }}}

setopt autocd
setopt histignorespace
setopt histignoredups

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"
HISTFILE=~/.histfile

if (( UID != 0 )); then
    export PS1=$'%{\e[0;34m%}[%{\e[0;36m%}%~%{\e[0;34m%}] %{\e[00m%}~ '
else
    export PS1=$'%{\e[0;31m%}[%{\e[0;35m%}%~%{\e[0;31m%}] %{\e[00m%}# '
fi;

export LS_OPTIONS="--color=auto"
export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/.lein/bin:$HOME/bin:$HOME/.gem/ruby/1.9.1/bin:$PATH:$HOME/.gem/ruby/2.0.0/bin
export HISTFILESIZE=10000
export HISTSIZE=10000
export BROWSER=firefox
export IRCNAME="Bronsa"
export PAGER="most"
export LANGUAGE=en
export LANG=en_US.UTF-8
export MAILDIR=$HOME/.mail
export PRINTER="Photosmart_C4400"
# alias ls='ls $LS_OPTIONS --ignore "#*#" --ignore "*~"'
alias ll='ls -l'
alias la='ls -a'
alias EMACS=/usr/bin/emacs
alias emacs='emacsclient -c -nw'
# alias xemacs='emacsclient -c -n -e "(set-mouse-color \"white\")"'
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
# alias java=drip
alias clj-head="rlwrap -b \$BREAK_CHARS -c -i -f /home/bronsa/.clj_completions -r java -Xshare:on -server -XX:+AggressiveOpts -XX:+TieredCompilation -Xbootclasspath/a:/home/bronsa/src/clojure/target/clojure-1.6.0-master-SNAPSHOT.jar clojure.main"
alias cljs="rlwrap -b \$BREAK_CHARS /home/bronsa/src/clojurescript/script/repljs"
alias cljsc="$HOME/src/clojurescript/bin/cljsc"
alias gchi=ghci
alias l=ls
alias s=ls
alias sls=ls
alias sl=ls
alias d=cd
alias e=emacs
alias c=cd
alias k=killall
alias gcc='gcc -Wall -Wextra -std=c99 -pedantic -pedantic-errors '
alias halt="halt -p"
alias download="aria2c -c -s 100 --file-allocation=none --summary-interval=0"
alias kmap="xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'"
alias xpaste='xclip -selection clipboard -o'
alias freecache='sync; echo 3 > /proc/sys/vm/drop_caches'
alias printer="lp"
alias mp3towav="for i in *.mp3; do mplayer -ao pcm:file=\"\${i%\.mp3}.wav\" \"\$i\"; done"
alias sscreenshot='scrot -s -d 3 screenshot.png; imageshack screenshot.png; rm screenshot.png'
alias screenshot='scrot -d 3 screenshot.png; imageshack screenshot.png; rm screenshot.png'
alias clj=clj-head
alias aria=aria2c -j16 -s16 -c --file-allocation=none -m0 --max-connection-per-server=16 --min-split-size=5M --summary-interval=60 -t5
alias mplayer=mpv
alias myip="curl -s http://checkip.dyndns.org/ | grep --color=no -Po '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'"
all2wav () {
    : ${1?"USAGE: all2wav <file.ext> [outfile]"}
    local OUTFILE="${2}"
    [ -z "${2}" ] && OUTFILE="${1%.*}.wav"
    mplayer "${1}" -ao pcm:file="${OUTFILE}" -novideo
}
all2mp3 () {
    : ${1?"USAGE: all2mp3 <file.ext> [outfile]"}
    local OUTFILE="${2}"
    [ -z "${2}" ] && OUTFILE="${1%.*}.mp3"
    all2wav "${1}" audiodump.wav
    lame audiodump.wav "${OUTFILE}"
    rm audiodump.wav
}

for keycode in '[' '0'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done

alias mountprivate="mount -t ecryptfs /media/private/.p /media/private/p"
alias nopaste=sprunge
