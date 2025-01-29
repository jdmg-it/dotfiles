[[ -f ~/.config/zsh/plugins.zsh ]] && source ~/.config/zsh/plugins.zsh
[[ -f ~/.config/zsh/aliases.zsh ]] && source ~/.config/zsh/aliases.zsh

if [[ $(uname) == "Linux" ]]; then
  [[ -f ~/.config/zsh/paths.linux.zsh ]] && source ~/.config/zsh/paths.linux.zsh
elif [[ $(uname) == "Darwin" ]]; then
  [[ -f ~/.config/zsh/paths.mac.zsh ]] && source ~/.config/zsh/paths.mac.zsh
fi

neofetch
