neofetch

# Linux
if [[ $(uname) == "Linux" ]]; then
	# fnm
	FNM_PATH="/home/jd/.local/share/fnm"
	if [ -d "$FNM_PATH" ]; then
	  export PATH="/home/jd/.local/share/fnm:$PATH"
	  eval "`fnm env`"
	fi

#MacOS
elif [[ $(uname) == "Darwin" ]]; then
	PATH=~/.console-ninja/.bin:$PATH
	# pnpm
	export PNPM_HOME="/Users/jd/Library/pnpm"
	case ":$PATH:" in
	  *":$PNPM_HOME:"*) ;;
	  *) export PATH="$PNPM_HOME:$PATH" ;;
	esac
	# pnpm end
	
	eval "$(fnm env --use-on-cd)"
fi

eval "$(starship init zsh)"

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
