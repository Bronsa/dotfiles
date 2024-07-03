HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorespace
setopt histignoredups
HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"

cd ~

if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1
    fi
fi

setopt autocd

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

PROMPT='[%~]> '

export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/bin:$PATH:/snap/bin
export LANGUAGE=en
export LANG=en_US.UTF-8
alias emacs="emacsclient -c -nw"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias E="SUDO_EDITOR=\"emacsclient -t -a emacs\" sudo -e"
alias ll='ls -l'
alias la='ls -a'
alias l=ls
alias e=emacs

bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word

portpid() {
    lsof -i 4tcp:$1 -sTCP:LISTEN -Fp
}

export GUARD_NOTIFY=false

# opam configuration
[[ ! -r /home/bronsa/.opam/opam-init/init.zsh ]] || source /home/bronsa/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null
