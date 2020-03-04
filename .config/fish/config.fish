set GREP_OPTIONS '--color=auto'
set LESS '-g -i -M -R -W'

alias ll='ls -l'
alias n='npm run start-dev'
alias y='yarn start-dev'
alias yr='yarn;yarn start-dev'
alias nrl='npm run lint'
alias nipl='npm i --package-lock-only'
alias lint='npm run lint'
alias rclean='rm -rf ./node_module & yarn clean'
alias vi='nvim'
alias oni='/Applications/Onivim2.app/Contents/MacOS/Oni2'

set -x PATH $HOME/.nodebrew/current/bin $PATH
set -x NODE_ENV development
set -x CONFIG_SERVICE_KEY Doroa7mi3oXai7lai5Geikolaeth7Jiy
set -x PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set -x MANPATH /usr/local/share/man/ja_JP.UTF-8:(manpath)
