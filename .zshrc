# npm global binaries (npm v11+ FIX — MUST BE FIRST)
export PATH="$HOME/.npm-global/bin:$PATH"


# NVM / NODE
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"


# BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
[ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"


# OH MY ZSH
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME=""

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# ALIASES
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


# CUSTOM PROMPT (FIXED)
autoload -Uz vcs_info
setopt PROMPT_SUBST

zstyle ':vcs_info:git:*' formats '(%b)'
zstyle ':vcs_info:git:*' actionformats '%b|%a'

function precmd() {
  vcs_info

  if [[ "$vcs_info_msg_0_" == "(main)" ]]; then
    GIT_BRANCH_COLOR="%F{#F63049}"     
  elif [[ "$vcs_info_msg_0_" == "(develop)" ]]; then
    GIT_BRANCH_COLOR="%F{#FF6500}"     
  else
    GIT_BRANCH_COLOR="%F{#296374}"      
  fi
}

PROMPT='%F{#305669}%1~%f %F{#3BC1A8}git:%f${GIT_BRANCH_COLOR}${vcs_info_msg_0_}%f%F{#3BC1A8}➤%f '

# valid commands
ZSH_HIGHLIGHT_STYLES[command]='fg=#3BC1A8'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#3BC1A8'

# unknown / wrong commands 
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#FF6500'

# arguments
ZSH_HIGHLIGHT_STYLES[argument]='fg=#ABB2BF'

# paths
ZSH_HIGHLIGHT_STYLES[path]='fg=#61AFEF'

# options like -la
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=#E6A23C'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=#E6A23C'

