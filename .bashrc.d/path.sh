# custom user path

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
prependpath $HOME/bin
unset prependpath
export PATH

unset prependpath
export PATH


export MANPATH=$MANPATH:$HOME/.local/share/man
