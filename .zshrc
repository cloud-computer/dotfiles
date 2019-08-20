# Ignore checking for multiple antigens running simultaneously
ANTIGEN_MUTEX=false

# Load antigen plugin manager
source antigen.zsh

# Use oh-my-zsh framework
antigen use oh-my-zsh

# Bundles from oh-my-zsh
antigen bundle command-not-found
antigen bundle docker
antigen bundle docker-compose
antigen bundle fzf
antigen bundle git
antigen bundle gnu-utils
antigen bundle gpg-agent
antigen bundle ubuntu

# Bundles from third parties
antigen bundle buonomo/yarn-completion
antigen bundle lukechilds/zsh-nvm
antigen bundle paulirish/git-open
antigen bundle popstas/zsh-command-time
antigen bundle zdharma/zsh-diff-so-fancy
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-history-substring-search

# Load the theme
antigen theme avit

# Apply antigen plugins
antigen apply

# Disable zsh errors when no globs are matched
unsetopt nomatch

# Do not remove spaces when piping commands
ZLE_REMOVE_SUFFIX_CHARS=

# Set zsh history file location
export HISTFILE=$HOME/.cache/zsh/histfile
mkdir -p $(dirname $HISTFILE)

# Set the shell prompt
export PROMPT='
${_current_dir}$(git_prompt_info)
%{$fg[$CARETCOLOR]%}▶%{$resetcolor%} '

# Alias git commands
alias a="git a"
alias b="git b"
alias aa="git aa"
alias ap="git ap"
alias bd="git bd"
alias ca="git ca"
alias cam="git cam"
alias camp="git camp"
alias cln="git cln"
alias cm="git cm"
alias co="git co"
alias cob="git cob"
alias cop="git cp"
alias d="git d"
alias db="git db"
alias dbl="git dbl"
alias ll="git l"
alias p="git p"
alias pf="git pf"
alias pp="git pp"
alias pu="git pu"
alias s="git s"

# Alias common commands to better alternatives
alias apt-search="apt-cache search"
alias apt-ls="dpkg-query -L"
alias ascii="figlet -f slant -m 2"
alias c=cat
alias cat=bat
alias e="docker ps --format '{{.Names}}' | f --bind \"enter:execute(docker exec -it {} zsh </dev/tty >/dev/tty 2>&1)+abort\""
alias f="fzf --height 5% --reverse"
alias g=grep
alias l="ls -lah"
alias pastebin="curl -F 'f:1=<-' ix.io"
alias ptree="ps xf -o pid,ppid,pgrp,euser,args"
alias scripts="cat package.json | jq .scripts"
alias t="tmux -S $CLOUD_COMPUTER_TMUX/.tmux.sock"
alias tn="TMUX= t new-session -s on-demand-$(date +%M%S) -t"
alias ts="t display-message -p '#S'"
alias tk="t kill-session -t"
alias tree="tree -a -I 'node_modules|.git' -L 4"
alias u=".."
alias uu="..."
alias uuu="...."
alias v=vcsh
alias vcshp="VCSH_REPO_D=$HOME/.config/vcsh/repo-private.d vcsh"
alias vd="vcsh foreach diff"
alias vp=vcshp
alias vps="vcshp status"
alias vpd="vcshp foreach diff"
alias vs="vcsh status"
alias x='xargs -n 1 -I @'

# Load jump shell
eval "$(jump shell zsh)"

# Unlock ssh private key
eval `keychain --eval id_rsa 2>/dev/null`

login () {
  # Clone secrets if not already cloned
  if [ ! -f $HOME/.ssh-private/id_rsa ]; then
    . $HOME/.config/scripts/clone-secrets.sh
    . $HOME/.zshenv
  fi
}

logout () {
  $HOME/.config/scripts/clean-secrets.sh
}

transfer () {
  curl -# -F "file=@$1" https://0x0.st
}
