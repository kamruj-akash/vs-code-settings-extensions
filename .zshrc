# ================================
# ZSH BASIC SETUP
# ================================

# npm global binaries (npm v11+ FIX — MUST BE FIRST)
export PATH="$HOME/.npm-global/bin:$PATH"

# ================================
# NVM / NODE
# ================================

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"

# ================================
# BUN
# ================================

export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

# ================================
# OH MY ZSH
# ================================

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ================================
# ALIASES
# ================================

alias cls="clear"
alias ll="ls -lah"
alias ..="cd .."
alias ...="cd ../.."

# Git shortcuts
alias gs="git status"
alias ga="git add"
alias gc="git commit -m"
alias gp="git push"
alias gl="git log --oneline --graph --decorate"

# ================================
# CUSTOM PROMPT
# ================================

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats '(%b)'
setopt PROMPT_SUBST

PROMPT='%F{#027F86}%1~%f %F{#00c896}git:%f%F{#F54900}${vcs_info_msg_0_}%f %F{#CA2A31}➤%f '

# ================================
# OPTIONAL
# ================================

# export LANG=en_US.UTF-8
# export EDITOR=nvim
