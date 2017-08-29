# vim:ft=sh:
if [ -r ~/.profile ]; then
  source ~/.profile
fi

if [ -r ~/.bash_funcs ]; then
  source ~/.bash_funcs
fi

export CLICOLOR=1
export HISTCONTROL=ignoreboth
export EDITOR=vim

PATH=~/bin:"$PATH"
PATH=bin:"$PATH"
export PATH

export IDEA_VM_OPTIONS=~/.idea64.vmoptions
export ANDROID_HOME=/data/AndroidStudio/Sdk/

# https://youtrack.jetbrains.com/oauth?state=%2Fissue%2FIDEA-78860
export IBUS_ENABLE_SYNC_MODE=1

export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

_git_prompt() {
  local ref="$(command git symbolic-ref -q HEAD 2>/dev/null)"
  if [ -n "$ref" ]; then
    echo " (${ref#refs/heads/})"
  fi
}

_failed_status() {
  [ "$PIPESTATUS" -ne 0 ] && printf "$"
}

_success_status() {
  [ "$PIPESTATUS" -eq 0 ] && printf "$"
}

PS1='\[\e[0;31m\]\w\[\e[m\]$(_git_prompt) \[\e[1;31m\]$(_failed_status)\[\e[m\]$(_success_status) '

# Allow <C-s> to pass through to shell and programs
stty -ixon -ixoff
