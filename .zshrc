cd ~

if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1
    fi
fi

setopt autocd
setopt histignorespace
setopt histignoredups

bindkey -e

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"
HISTFILE=~/.histfile

PROMPT='[%~]> '

export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/bin:$PATH
export HISTFILESIZE=10000
export HISTSIZE=10000
export LANGUAGE=en
export LANG=en_US.UTF-8
alias emacs="emacsclient -c -nw"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
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
