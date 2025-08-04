cd ~

eval $(dircolors)

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

PROMPT='[%~]> '

setopt autocd

zmodload zsh/complist
autoload -Uz compinit && compinit
autoload -U select-word-style

zstyle ':completion:*:*:*:*:descriptions' format '%B-- %d --%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

select-word-style bash

source .zsh.d/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source .zsh.d/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey -M menuselect '^[[Z' reverse-menu-complete
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt histignorespace
setopt histignoredups
HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd..:halt:reboot"

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

portpid() {
    lsof -i 4tcp:$1 -sTCP:LISTEN -Fp
}


# fnm
FNM_PATH="/home/bronsa/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/bronsa/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/bronsa/bin/google-cloud-sdk/path.zsh.inc' ]; then . '/home/bronsa/bin/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/bronsa/bin/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/bronsa/bin/google-cloud-sdk/completion.zsh.inc'; fi
export PATH="$PATH:/opt/mssql-tools18/bin"


export MB_EDITION=ee

