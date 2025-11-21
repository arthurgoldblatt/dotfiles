# History and editor
setopt inc_append_history share_history
export HISTSIZE=10000 SAVEHIST=10000
export EDITOR="vim"

# Completion
autoload -U compinit && compinit

# Antidote plugins (fzf-tab, zsh-you-should-use)
if [ -f /opt/homebrew/opt/antidote/share/antidote/antidote.zsh ]; then
  source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
  antidote load ~/.zsh_plugins.txt
fi

# Prompt: oh-my-posh (fallback to default prompt if not installed)
if command -v oh-my-posh >/dev/null 2>&1; then
  eval "$(oh-my-posh init zsh --config $HOME/.config/oh-my-posh/default.omp.toml)"
fi

# Navigation
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# Aliases (only if tool is available)
if command -v eza >/dev/null 2>&1; then alias ls="eza -lah --git"; fi
if command -v bat >/dev/null 2>&1; then alias cat="bat"; fi
if command -v rg >/dev/null 2>&1; then alias grep="rg"; fi
# Git shortcuts
alias g="git"
alias gst="git status -sb"
alias gco="git checkout"
alias gcb="git checkout -b"
alias ga="git add"
alias gap="git add -p"
alias gc="git commit"
alias gca="git commit --amend --no-edit"
alias gcam="git commit -am"
alias gl="git pull --rebase"
alias gp="git push"
alias glog="git log --oneline --graph --decorate"
alias gd="git diff"
alias gds="git diff --staged"

# SSH agent: start if missing/stale and load GitHub key
if [ -f "$HOME/.ssh/id_ed25519" ]; then
  if ! ssh-add -l >/dev/null 2>&1; then
    if [ -n "$SSH_AUTH_SOCK" ] && [ ! -S "$SSH_AUTH_SOCK" ]; then
      unset SSH_AUTH_SOCK
    fi
    eval "$(ssh-agent -s)" >/dev/null 2>&1
    ssh-add "$HOME/.ssh/id_ed25519" >/dev/null 2>&1
  fi
fi

# Coreutils from Homebrew first
export PATH="/opt/homebrew/opt/coreutils/libexec/gnubin:$PATH"

# Completion extras
if [ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi
if [ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
