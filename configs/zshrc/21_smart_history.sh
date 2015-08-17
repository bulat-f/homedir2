setopt appendhistory
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_IGNORE_SPACE

setopt INC_APPEND_HISTORY

bindkey '^[OA' history-beginning-search-backward
bindkey '^[OB' history-beginning-search-forward

setopt autocd

autoload -Uz compinit
compinit

setopt extendedglob nomatch notify

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/zsh/.zshrc'

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

setopt correctall