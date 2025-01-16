# .bashrc

[[ $- != *i* ]] && return

set -o vi
stty -ixon
shopt -qs extglob
shopt -s checkwinsize
shopt -s no_empty_cmd_completion

if [ $EUID == 0 ]; then
    PS1='\[\033[01;31m\]\h\[\033[01;34m\] \w \$\[\033[00m\] '
else
    PS1='\[\033[01;32m\]\u@\h\[\033[00m\] \[\033[01;34m\]\W \$\[\033[00m\] '
fi

# Custom user path
prependpath () {
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

export PATH=
prependpath /sbin
prependpath /bin
prependpath /usr/sbin
prependpath /usr/bin
prependpath /usr/local/sbin
prependpath /usr/local/bin
prependpath $HOME/.local/bin
prependpath ~/bin
unset prependpath
export PATH

unset prependpath
export PATH

alias grep='grep --color=auto'
alias ip='ip --color=auto'
alias ls='ls --color=auto'
alias ll='ls -lh'
alias la='ls -a'
alias  l='ls -lha'
alias df='df -h'
alias free='free -h'
alias cls='tput reset'

if [ -d $HOME/.bashrc.d ]; then
  for sh in $HOME/.bashrc.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi
