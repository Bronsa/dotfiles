export LS_OPTIONS="--color=auto"
eval `dircolors`
alias startx="startx &> .log"
alias ls='ls $LS_OPTIONS' # --ignore "#*#" --ignore "*~"'
alias ll='ls $LS_OPTIONS -l'
alias grep='grep $LS_OPTIONS'
alias gcc='gcc -Wall -Wextra -ansi -pedantic -pedantic-errors '
alias vim="vim -p"
alias halt="halt -p"
alias download="aria2c -c -s 100 --file-allocation=none --summary-interval=0"
alias kmap="xev | sed -n 's/^.*keycode *\([0-9]\+\).*$/keycode \1 = /p'"
alias ..='cd ..'
alias xpaste='xclip -selection clipboard -o'
alias freecache='sync; echo 3 > /proc/sys/vm/drop_caches'
alias printer="lp"
alias mp3towav="for i in *.mp3; do mplayer -ao pcm:file=\"\${i%\.mp3}.wav\" \"\$i\"; done"
alias sscreenshot='scrot -s -d 3 screenshot.png; imageshack screenshot.png; rm screenshot.png'
alias restoremozilla='cp .mozilla.tar.orig .mozilla.tar && rm -rf .mozilla/* &&tar xvf .mozilla.tar .mozilla'
export PATH=.:$HOME/httpd/bin:/opt/bin:/opt/sbin:/sbin:/usr/sbin:/usr/local/bin:/usr/games:/usr/games/bin:$PATH
export HISTFILESIZE=10000
export HISTSIZE=10000
export BROWSER=firefox
export HOSTALIASES=/etc/hosts
export IRCNAME="Bronsa"
export PAGER="most"
export LANGUAGE=en
export LANG=en_US.UTF-8
export PRINTER="Photosmart_C4400"

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"
#setopt RM_STAR_WAIT

autoload zkbd
source $HOME/.rxvt-:0.0

export TERM="xterm-256color"

[[ -n ${key[Backspace]} ]] && bindkey "${key[Backspace]}" backward-delete-char
[[ -n ${key[Delete]} ]] && bindkey "${key[Delete]}" delete-char
[[ -n ${key[Up]} ]] && bindkey "${key[Up]}" up-line-or-search
[[ -n ${key[Left]} ]] && bindkey "${key[Left]}" backward-char
[[ -n ${key[Down]} ]] && bindkey "${key[Down]}" down-line-or-search
[[ -n ${key[Right]} ]] && bindkey "${key[Right]}" forward-char


prompt_command() {
    local pwdmaxlen=25
    local trunc_symbol=".."
    local dir=${PWD##*/}
    pwdmaxlen=$(( ( pwdmaxlen < ${#dir} ) ? ${#dir} : pwdmaxlen ))
    NEW_PWD=${PWD/#$HOME/\~}
    local pwdoffset=$(( ${#NEW_PWD} - pwdmaxlen ))
    if [ ${pwdoffset} -gt "0" ]
    then
         NEW_PWD=${NEW_PWD:$pwdoffset:$pwdmaxlen}
        NEW_PWD=${trunc_symbol}/${NEW_PWD#*/}
    fi
}

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

autoload -Uz compinit
compinit
autoload -U promptinit
promptinit

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
setopt correctall
setopt hist_ignore_all_dups
setopt autocd
setopt extendedglob

zsh_prompt()  {
	curdir=`echo $PWD | sed -r -e 's/^.*(\/.*)$/\1/'`
	pathlen=`echo $curdir | wc -c`
	let pathlen=pathlen-1

	if [ $pathlen -gt 25 ]; then
		NEWPWD="../$curdir"
	else
		NEWPWD=$PWD
	fi
}
if (( UID != 0 )); then
    export PS1=$'%{\e[0;34m%}[%{\e[0;36m%}%~%{\e[0;34m%}] %{\e[00m%}~ '
    [[ -s "/home/bronsa/.rvm/scripts/rvm" ]] && source "/home/bronsa/.rvm/scripts/rvm"
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
alias xemacs='emacsclient -c -n -e "(set-background-color \"black\")(set-mouse-color \"white\")"'
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
alias clj-head="rlwrap -b \$BREAK_CHARS java -cp $HOME/src/clojure/target/clojure-*-master-SNAPSHOT.jar clojure.main"

clj () {
    p=$PWD
    cd ~/.dummy-clj-project/
    rlwrap -b "$BREAK_CHARS" -c -i -f "$HOME/.clj_completions" -r lein repl
    cd $p
}

alias cljs="rlwrap -b \$BREAK_CHARS $HOME/src/clojurescript/script/repljs"
alias cljsc="$HOME/src/clojurescript/bin/cljsc"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/.lein/bin:$HOME/bin:$PATH

