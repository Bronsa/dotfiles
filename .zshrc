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
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/.lein/bin:$HOME/bin:$PATH:/usr/local/tranquil/bin:/:$HOME/.gem/ruby/2.2.0/bin
export CL_SOURCE_REGISTRY=$HOME/src/stumpwm/ #:$CL_SOURCE_REGISTRY
export HISTFILESIZE=10000
export HISTSIZE=10000
export BROWSER=firefox
export IRCNAME="Bronsa"
export PAGER="most"
export LANGUAGE=en
export LANG=en_US.UTF-8
alias emacs="emacsclient -c -nw"

alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudo -e"
alias ll='ls -l'
alias la='ls -a'
alias l=ls
alias s=ls
alias lsl=ls
alias sls=ls
alias d=cd
alias e=emacs
alias c=cd
alias gcc='gcc -Wall -Wextra -std=c99 -pedantic -pedantic-errors '
alias g++='g++ -Wall -Wextra -ansi -pedantic -pedantic-errors -O2 -march=native -pipe'
alias halt="halt -p"
alias nopaste=sprunge
alias plz=sudo

export JVM_OPTS="-Dapple.awt.UIElement=true -XX:+UnlockCommercialFeatures -XX:+FlightRecorder"
export LEIN_SNAPSHOTS_IN_RELEASE=1
export XSHARE='' # '-Xshare:on'
export CLJ_VERSION="1.9.0-master-SNAPSHOT"
export BREAK_CHARS="\"#'(),;\`\\|!?[]{}"
alias java='rlwrap -b \$BREAK_CHARS -c -i -f $HOME/.clj_completions -r java'
alias cljsc="$HOME/src/clojurescript/bin/cljsc"
alias cljv="java -server -Xbootclasspath/a:$HOME/src/clojure/target/clojure-1.9.0-master-SNAPSHOT.jar -cp .:./classes clojure.main"
alias cljs="rlwrap -b \$BREAK_CHARS $HOME/src/clojurescript/script/repljs"
alias build-clj="java -Dclojure.compiler.direct-linking=true -Xshare:dump -Xverify:none -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xbootclasspath/a:$HOME/.m2/repository/org/clojure/clojure/$CLJ_VERSION/clojure-$CLJ_VERSION.jar"
alias clj="java -Dclojure.compiler.direct-linking=true $XSHARE -Xverify:none -client -XX:+TieredCompilation -XX:TieredStopAtLevel=1 -Xbootclasspath/a:$HOME/.m2/repository/org/clojure/clojure/$CLJ_VERSION/clojure-$CLJ_VERSION.jar -cp .:./classes clojure.main"

point-repl () {
    pushd $HOME/src/infrastructure
    git pull
    SSH_USER=nicola APPS=$1 ENV=$2 REV=$3 $HOME/src/infrastructure/deploy/point-repl
    popd
}

deploy () {
    pushd $HOME/src/infrastructure
    git pull
    SSH_USER=nicola APPS=$1 ENV=$2 REV=$3 $HOME/src/infrastructure/deploy/create-rc
    popd
}

point-light () {
    pushd $HOME/src/infrastructure
    git pull
    SSH_USER=nicola APPS=$1 ENV=$2 REV=$3 $HOME/src/infrastructure/deploy/point-light
    popd
}

point-dark () {
    pushd $HOME/src/infrastructure
    git pull
    SSH_USER=nicola APPS=$1 ENV=$2 REV=$3 $HOME/src/infrastructure/deploy/point-dark
    popd
}

create-tunnels () {
    pushd $HOME/src/infrastructure
    git pull
    SSH_USER=nicola $HOME/src/infrastructure/k8s/cluster/create-tunnel-all
    popd

}

compile-clojure () {
    pushd $HOME/src/clojure
    rm -rf target
    mvn install -Dmaven.test.skip=true
    popd
}


for keycode in '[' '0'; do
    bindkey "^[${keycode}A" history-substring-search-up
    bindkey "^[${keycode}B" history-substring-search-down
done
bindkey "\e^[[C" forward-word
bindkey "\e^[[D" backward-word

portpid() {
    lsof -i 4tcp:$1 -sTCP:LISTEN -Fp
}

export GUARD_NOTIFY=false
