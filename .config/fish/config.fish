fish_add_path /opt/homebrew/bin
fish_add_path /opt/homebrew/sbin

eval (pyenv init -| source)

set GREP_OPTIONS '--color=auto'
set LESS '-g -i -M -R -W'

alias ll='ls -l'
alias lla='ls -al'
alias python='python3'
alias pip='pip3'
alias t='tig'
alias vim='nvim'
alias python="python3"
alias pip="pip3"
alias vi='nvim'
alias oni='/Applications/Onivim2.app/Contents/MacOS/Oni2'

set PATH $HOME/.nodebrew/current/bin $PATH
set PUPPETEER_SKIP_CHROMIUM_DOWNLOAD true
set -gx VOLTA_HOME '$HOME/.volta'
set -gx PATH '$VOLTA_HOME/bin' $PATH
set -gx JAVA_HOME '/usr/libexec/java_home -v 17'
set -gx GOPATH $HOME
set -gx PATH $PATH:$GOPATH/bin