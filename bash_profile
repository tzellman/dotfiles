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
PATH=/Users/tzellman/Library/Python/3.7/bin:"$PATH"
export PATH

export IDEA_VM_OPTIONS=~/.idea64.vmoptions
export ANDROID_HOME=/data/AndroidStudio/Sdk/

# IJ - Keyboard input sometimes is blocked when IBus is active - https://youtrack.jetbrains.com/issue/IDEA-78860
export IBUS_ENABLE_SYNC_MODE=1

# https://youtrack.jetbrains.com/oauth?state=%2Fissue%2FIDEA-78860
export IBUS_ENABLE_SYNC_MODE=1

export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

#[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

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
export PATH="/usr/local/opt/mysql-client/bin:$PATH"
source ~/git-completion.bash
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"
export FLAGS_GETOPT_CMD="$(brew --prefix gnu-getopt)/bin/getopt"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tzellman/google-cloud-sdk/path.bash.inc' ]; then . '/Users/tzellman/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tzellman/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/tzellman/google-cloud-sdk/completion.bash.inc'; fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"
export BASH_SILENCE_DEPRECATION_WARNING=1
