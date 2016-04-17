# ~/.bashrc: executed by bash(1) for non-login shells.

export PS1='\[\033[1m\]\#/$?/\j\[\033[m\] \[\033[31m\]\u@\H\[\033[m\]\[\033[1m\]:pts/\l \t [\w] \$\[\033[m\] '
umask 022

# enable bash completion in interactive shells
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# You may uncomment the following lines if you want `ls' to be colorized:
# export LS_OPTIONS='--color=auto'
# eval "`dircolors`"
# alias ls='ls $LS_OPTIONS'
# alias ll='ls $LS_OPTIONS -l'
# alias l='ls $LS_OPTIONS -lA'
#
# Some more alias to avoid making mistakes:
# alias rm='rm -i'
# alias cp='cp -i'
# alias mv='mv -i'
alias aptitude-just-recommended='aptitude -o "Aptitude::Pkg-Display-Limit=!?reverse-depends(~i) ( ?reverse-recommends(~i) | ?reverse-suggests(~i) ) !?reverse-recommends(^abe-) !?reverse-suggests(^abe-) ~M !?essential"'
alias aptitude-also-via-dependency='aptitude -o "Aptitude::Pkg-Display-Limit=~i !~M ( ?reverse-depends(~i) | ?reverse-recommends(~i) | ?reverse-suggests(~i) ) !?essential"'
alias aptitude-review-unmarkauto-libraries='aptitude -o "Aptitude::Pkg-Display-Limit=( ^lib !-dev$ !-dbg$ !-utils$ !-tools$ !-bin$ !-doc$ !-progs$ !-clients$ !-examples$ !^libreoffice | -data$ | -common$ | -base$ !^r-base ) !~M ~i"'
alias aptitude-upgradable-to-experimental='aptitude -o "Aptitude::Pkg-Display-Limit=~i ?narrow(!~VCURRENT, ~Aexperimental)"'
alias aptitude-newer-than-in-archive='aptitude -o "Aptitude::Pkg-Display-Limit=( `apt-show-versions | fgrep newer | awk '"'"'{printf "~n ^"$1"$ | "}'"'"' | sed -e '"'"'s/| *$//'"'"'` )"'
alias acp='apt-cache policy'
alias acs='apt-cache show'
alias ac='apt-cache search'
alias acsrc='apt-cache showsrc'
alias acr='apt-cache rdepends'
alias acsp='apt-cache showpkg'
