# PATH=${PATH:-/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin}
# export PATH

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
