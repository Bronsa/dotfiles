unset GREP_OPTIONS
# azzoppati {{{
[ -s "${ZDOTDIR:-$HOME}/.zoppo/zoppo.zsh" ] && source "${ZDOTDIR:-$HOME}/.zoppo/zoppo.zsh"
# }}}

setopt autocd
setopt histignorespace
setopt histignoredups

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"
HISTFILE=~/.histfile


#export DISPLAY="localhost:1"
export XAUTHORITY=$HOME/.Xauthority
export LS_OPTIONS="--color=auto"
export EDITOR="emacsclient -c -nw"
alias emacs="emacsclient -c -nw"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/.lein/bin:$HOME/bin:$PATH:/usr/local/tranquil/bin
export CL_SOURCE_REGISTRY=$HOME/src/stumpwm/ #:$CL_SOURCE_REGISTRY
export HISTFILESIZE=10000
export HISTSIZE=10000
export BROWSER=firefox
export IRCNAME="Bronsa"
export PAGER="most"
export LANGUAGE=en
export LANG=en_US.UTF-8
alias ll='ls -l'
alias la='ls -a'
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
#alias clj-head="rlwrap -b \$BREAK_CHARS -c -i -f $HOME/.clj_completions -r java $JAVA_OPTS -cp .:$HOME/src/clojure/target/clojure-1.7.0-master-SNAPSHOT.jar -server -XX:+AggressiveOpts -XX:+TieredCompilation clojure.main"
alias build-clj="sudo su -c 'java -Xshare:dump -Xbootclasspath/a:$HOME/src/clojure/target/clojure-1.7.0-master-SNAPSHOT.jar clojure.main'"
alias clj-head="rlwrap -b \$BREAK_CHARS -c -i -f $HOME/.clj_completions -r java -server -Dclojure.compiler.direct-linking=true -Xverify:none -XX:+AggressiveOpts -XX:+TieredCompilation -Xbootclasspath/a:$HOME/src/clojure/target/clojure-1.8.0-master-SNAPSHOT.jar -cp .:./classes clojure.main"
alias clj-bare="rlwrap -b \$BREAK_CHARS -c -i -f $HOME/.clj_completions -r java -server -Xbootclasspath/a:$HOME/src/clojure/target/clojure-1.8.0-master-SNAPSHOT.jar -cp .:./classes clojure.main"
alias cljs="rlwrap -b \$BREAK_CHARS $HOME/src/clojurescript/script/repljs"
alias cljsc="$HOME/src/clojurescript/bin/cljsc"
alias l=ls
alias s=ls
alias d=cd
alias e=emacs
alias c=cd
alias gcc='gcc -Wall -Wextra -std=c99 -pedantic -pedantic-errors '
alias halt="halt -p"
alias clj=clj-head
for keycode in '[' '0'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done

alias g++='g++ -Wall -Wextra -ansi -pedantic -pedantic-errors -O2 -march=native -pipe'
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudo -e"
export JVM_OPTS="-Dapple.awt.UIElement=true"
export LEIN_SNAPSHOTS_IN_RELEASE=1
bindkey "\e^[[C" forward-word
bindkey "\e^[[D" backward-word
