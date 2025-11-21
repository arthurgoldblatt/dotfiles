# Homebrew (prefer user install, then arm, then Intel)
if [ -x "$HOME/homebrew/bin/brew" ]; then
  eval "$("$HOME/homebrew/bin/brew" shellenv)"
elif [ -x /opt/homebrew/bin/brew ]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
  eval "$(/usr/local/bin/brew shellenv)"
fi

# pyenv
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# User-level Python CLIs
export PATH="$HOME/.local/bin:$PATH"

# fzf key bindings and completion (if installed via Homebrew)
if command -v brew >/dev/null 2>&1; then
  [ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
  [ -f "$(brew --prefix)/opt/fzf/shell/completion.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/completion.zsh"
fi
