HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorespace
setopt histignoredups
HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"

cd ~

setopt autocd

/usr/bin/keychain -q --nogui $HOME/.ssh/id_ed25519
source $HOME/.keychain/$(hostname)-sh

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

PROMPT='[%~]> '

export EDITOR="emacsclient -c -nw"
export ALTERNATE_EDITOR=""
export PATH=.:$HOME/bin:$PATH:/snap/bin
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

source .zsh.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source .zsh.d/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
