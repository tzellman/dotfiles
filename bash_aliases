#!/bin/bash

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias k='kubectl'
alias kt='kubetail'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias apt-installed='dpkg --get-selections | grep -v deinstall'

alias mvni='mvn install -DskipTests'
alias mvnci='mvn clean install -DskipTests'
alias mvncit='mvn clean install'
#alias gbxt='gradle build -x test'
alias gbi='gradle build install -x test'
alias gb='gradle build'

alias dsa='docker stop $(docker ps -a -q)'
alias dra='docker rm $(docker ps -a -q)'
alias dre='docker rm $(docker ps -q -f status=exited)'
alias dvr='docker volume rm $(docker volume ls -qf dangling=true)'
alias drmi='docker rmi $(docker images --filter "dangling=true" -q --no-trunc)'
alias dtop='docker ps -q | xargs  docker stats --no-stream'

alias java8="export JAVA_HOME=`/usr/libexec/java_home -v 1.8.0_191`; java -version"
alias java11="export JAVA_HOME=`/usr/libexec/java_home -v 11`; java -version"

