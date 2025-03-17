# -*- mode: sh -*-

#
# Add element as first in PATH
#

prependpath(){
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

# PATH=
# prependpath /usr/local/sbin
# prependpath /usr/local/bin
# prependpath /usr/sbin
# prependpath /usr/bin
# prependpath /sbin
# prependpath /bin
# prependpath $HOME/.local/bin
# prependpath $HOME/bin
# unset prependpath
# export PATH


#
# Add element as last element to PATH
#

appendpath(){
  case ":${PATH}:" in
  *":${1}:"*) ;;
  *         )  PATH="${PATH:+$PATH:}$1"
  esac
}


#
# Initialize PATH
#

initpath(){
for x in \
  "$HOME/bin" \
  "$HOME/.local/bin" \
  "/usr/local/sbin" \
  "/usr/local/bin" \
  "/usr/sbin" \
  "/usr/bin" \
  "/sbin" \
  "/bin" \
  ; do
  [ -d "$x" ] || continue 
	case ":${PATH}:" in
	*":${x}:"*) ;;
	*) PATH="${PATH+${PATH}:}${x}" ;;
	esac
done
}


#
# Initialize minimal PATH
#

path(){
for x in \
	"$HOME/bin" \
	"$HOME/.local/bin" \
	"/usr/local/sbin" \
  "/usr/local/bin" \
	"/usr/bin" \
	; do
	[ -d "$x" ] || continue
	case ":${PATH}:" in
	*":${x}:"*) ;;
	*) PATH="${PATH+${PATH}:}${x}" ;;
	esac
done
}


#
# Initialize default PATH
#

defaultpath(){
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
}
