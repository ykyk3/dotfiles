source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-prompt.sh
source /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '

export GREP_OPTIONS='--color=auto'
export LESS='-g -i -M -R -W'

alias ll='ls -l'
alias n='npm run start-dev'
alias y='yarn start-dev'
alias yr='yarn;yarn start-dev'
alias nrl='npm run lint'
alias nipl='npm i --package-lock-only'
alias lint='npm run lint'

export PATH=$HOME/.nodebrew/current/bin:$PATH
export NODE_ENV=development
export CONFIG_SERVICE_KEY=Doroa7mi3oXai7lai5Geikolaeth7Jiy
export PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true
export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"

