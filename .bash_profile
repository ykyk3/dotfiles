if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi
# pyenvさんに~/.pyenvではなく、/usr/loca/var/pyenvを使うようにお願いする
export PYENV_ROOT=/usr/local/var/pyenv

# pyenvさんに自動補完機能を提供してもらう
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

export CLICOLOR=1
export LSCOLORS="GxFxCxDxBxegedabagaced"
export PGDATA=/usr/local/var/postgres
