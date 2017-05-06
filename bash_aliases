#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias apt-installed='dpkg --get-selections | grep -v deinstall'

alias mvni='mvn install -DskipTests'
alias mvnci='mvn clean install -DskipTests'
alias mvncit='mvn clean install'
alias gbxt='gradle build -x test'
alias gbi='gradle build install -x test'
alias gb='gradle build'
