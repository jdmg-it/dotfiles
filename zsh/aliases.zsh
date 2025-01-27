alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"

# BAT
alias cat='bat'

# LSD
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias lta='ls -a --tree'

# PHP ARTISAN
alias pas='php artisan serve'
alias pam='php artisan migrate:fresh --seed'
alias punit='php vendor/phpunit/phpunit/phpunit'

# NODE
alias nrd='npm run dev'

# FZF
alias fbat='fzf --preview="bat --color=always {}"'
alias fnvim='nvim $(fzf --preview="bat --color=always {}")'

