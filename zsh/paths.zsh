neofetch
# Linux
if [[ $(uname) == "Linux" ]]; then
	export BROWSER="wslview"
	export PATH="/home/jd/.local/share/fnm:$PATH"
fi

eval "$(starship init zsh)"
eval "$(fnm env --use-on-cd)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

PATH=~/.console-ninja/.bin:$PATH
# pnpm
export PNPM_HOME="/Users/jd/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end
