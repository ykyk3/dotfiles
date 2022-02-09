# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

alias python="python3"
alias pip="pip3"
alias vim="nvim"
alias vi="nvim"
# Customize to your needs...
export JAVA_HOME='/usr/libexec/java_home -v 17'
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# peco
function peco-src () {
	local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
	if [ -n "$selected_dir" ]; then
		BUFFER="cd ${selected_dir}"
		zle accept-line
	fi
	zle clear-screen
}
zle -N peco-src
bindkey '^g' peco-src

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
