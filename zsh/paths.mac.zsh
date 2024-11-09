PATH=~/.console-ninja/.bin:$PATH
# pnpm
export PNPM_HOME="/Users/jd/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

eval "$(fnm env --use-on-cd)"
eval "$(pyenv init --path)"
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
