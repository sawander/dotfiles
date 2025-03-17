# export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

prependpath () {
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

prependpath $HOME/.local/bin
prependpath $HOME/bin
unset prependpath
export PATH
