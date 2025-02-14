# windows manager
WM_VAR="/$ZELLIJ"
WM_CMD="zellij"

function start_if_needed() {
    if [[ $- == *i* ]] && [[ -z "${WM_VAR#/}" ]] && [[ -t 1 ]]; then
        exec $WM_CMD
    fi
}

# fzf
export PROJECT_PATHS="/Users/jd/Dev"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exlude .git"

# pnpm
export PNPM_HOME="/Users/jd/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# fnm
eval "$(fnm env --use-on-cd)"

# pyenv
eval "$(pyenv init --path)"

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
