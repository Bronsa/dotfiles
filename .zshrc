# Path to your oh-my-zsh configuration.
ZSH=/home/bronsa/.oh-my-zsh
source $ZSH/oh-my-zsh.sh

zstyle ':omz:editor' keymap 'emacs'
zstyle ':omz:editor' dot-expansion 'no'
zstyle ':omz:*:*' color 'yes'
zstyle ':omz:terminal' auto-title 'no'
zstyle ':omz:load' plugin 'archive' 'git' 'ssh-agent' 'command-not-found' 'rsync''zsh-syntax-highlighting' 'history-substring-search'


setopt histignorespace
setopt histignoredups

zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*' group-name ''

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

export PATH=.:/home/bronsa/.lein/bin:/home/bronsa/bin:.:/home/bronsa/httpd/bin:/opt/bin:/opt/sbin:/sbin:/usr/sbin:/usr/local/bin:/usr/games:/usr/games/bin:/home/bronsa/bin:/usr/lib/lightdm/lightdm:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"
HISTFILE=~/.histfile

export TERM="xterm-256color"

if (( UID != 0 )); then
    export PS1=$'%{\e[0;34m%}[%{\e[0;36m%}%~%{\e[0;34m%}] %{\e[00m%}~ '
else
    export PS1=$'%{\e[0;31m%}[%{\e[0;35m%}%~%{\e[0;31m%}] %{\e[00m%}# '
fi;

export LS_OPTIONS="--color=auto"
alias ls='ls $LS_OPTIONS --ignore "#*#" --ignore "*~"'
alias rsense-config='ruby $HOME/.emacs.d/lib/rsense/etc/config.rb > $HOME/.rsense'
export TERM="xterm-256color"
export EDITOR="emacsclient -c -nw"
alias EMACS=/usr/bin/emacs
alias emacs='emacsclient -c -nw'
alias xemacs='emacsclient -c -n -e "(set-mouse-color \"white\")"'
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
alias clj-head="rlwrap -b \$BREAK_CHARS -c -i -f /home/bronsa/.clj_completions -r java -XX:+TieredCompilation -Xbootclasspath/a:$(echo -n /home/bronsa/src/clojure/target/clojure-*-master-SNAPSHOT.jar) clojure.main"
alias cj='clj-head'
alias clj="rlwrap -b \$BREAK_CHARS -c -i -f /home/bronsa/.clj_completions -r java -XX:+TieredCompilation -cp `for i in /home/bronsa/.dummy-clj-prj/lib/*.jar ; do echo -n $i: ; done` clojure.main"
alias cljs="rlwrap -b \$BREAK_CHARS /home/bronsa/src/clojurescript/script/repljs"
alias cljsc="$HOME/src/clojurescript/bin/cljsc"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/.lein/bin:$HOME/bin:$PATH
export CLOJURESCRIPT_HOME="$HOME/src/clojurescript/"
#export JAVA_HOME=/usr/lib/jvm/java-7-sun-
export JAVA_HOME=/var/local/oab/src/x64-jdk
alias gchi=ghci
alias l=ls
alias s=ls
alias sls=ls
alias sl=ls
alias gcc='gcc -Wall -Wextra -ansi -pedantic -pedantic-errors '
alias vim="vim -p"
alias halt="halt -p"
alias download="aria2c -c -s 100 --file-allocation=none --summary-interval=0"
alias kmap="xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'"
alias xpaste='xclip -selection clipboard -o'
alias freecache='sync; echo 3 > /proc/sys/vm/drop_caches'
alias printer="lp"
alias mp3towav="for i in *.mp3; do mplayer -ao pcm:file=\"\${i%\.mp3}.wav\" \"\$i\"; done"
alias sscreenshot='scrot -s -d 3 screenshot.png; imageshack screenshot.png; rm screenshot.png'
alias restoremozilla='cp .mozilla.tar.orig .mozilla.tar && rm -rf .mozilla/* &&tar xvf .mozilla.tar .mozilla'
export HISTFILESIZE=10000
export HISTSIZE=10000
export BROWSER=firefox
export IRCNAME="Bronsa"
export PAGER="most"
export LANGUAGE=en
export LANG=en_US.UTF-8
export PRINTER="Photosmart_C4400"
# alias javac=/var/local/oab/src/x64-jdk/bin/javac
# alias javap=/var/local/oab/src/x64-jdk/bin/javap
# alias jar=/var/local/oab/src/x64-jdk/bin/jar


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
alias clj=clj-head
