# windows manager
WM_VAR="/$ZELLIJ"
WM_CMD="zellij"

function start_if_needed() {
    if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
    fi
}

# fzf
export PROJECT_PATHS="/home/jd/Dev"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

# fnm
FNM_PATH="/home/jd/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
	export PATH="$FNM_PATH:$PATH"
	eval "`fnm env`"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# starship
eval "$(starship init zsh)"

# carapace
export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
zstyle ':completion:*' format $'\e[2;37mCompleting %d\e[m'
source <(carapace _carapace)

# fzf
eval "$(fzf --zsh)"

# zoxide
eval "$(zoxide init zsh)"

# atuin
eval "$(atuin init zsh)"

# launch zellij
start_if_needed
