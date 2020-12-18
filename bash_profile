# vim:ft=sh:
if [ -r ~/.profile ]; then
  source ~/.profile
fi

if [ -r ~/.bash_funcs ]; then
  source ~/.bash_funcs
fi

if [ -r ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

export CLICOLOR=1
export HISTCONTROL=ignoreboth
export EDITOR=vim

PATH=~/bin:"$PATH"
PATH=bin:"$PATH"
export PATH

export IDEA_VM_OPTIONS=~/.idea64.vmoptions

# IJ - Keyboard input sometimes is blocked when IBus is active - https://youtrack.jetbrains.com/issue/IDEA-78860
export IBUS_ENABLE_SYNC_MODE=1

# https://youtrack.jetbrains.com/oauth?state=%2Fissue%2FIDEA-78860
export IBUS_ENABLE_SYNC_MODE=1

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

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
if [ -f '${HOME}/google-cloud-sdk/path.bash.inc' ]; then . '${HOME}/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/google-cloud-sdk/completion.bash.inc' ]; then . '${HOME}/google-cloud-sdk/completion.bash.inc'; fi
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi

export BASH_SILENCE_DEPRECATION_WARNING=1
export ANDROID_SDK_ROOT="${HOME}/Library/Android/sdk"
