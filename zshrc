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
export GOPATH=$HOME:git config ghq.root
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

# attach tmux on boot
if [[ ! -n $TMUX && $- == *l* ]]; then
  # get the IDs
  ID="`tmux list-sessions`"
  if [[ -z "$ID" ]]; then
    tmux new-session
  fi
  create_new_session="Create New Session"
  ID="$ID\n${create_new_session}:"
  ID="`echo $ID | $PERCOL | cut -d: -f1`"
  if [[ "$ID" = "${create_new_session}" ]]; then
    tmux new-session
  elif [[ -n "$ID" ]]; then
    tmux attach-session -t "$ID"
  else
    :  # Start terminal normally
fi
