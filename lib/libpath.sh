# PATH=${PATH:-/usr/local/bin:/usr/local/sbin:/usr/bin}
# export PATH

# /usr/bin /usr/local/bin /usr/local/sbin ~/go/bin ~/.cargo/bin ~/.local/bin ~/bin 


prependpath(){
  case ":$PATH:" in
    *":$1:"*) ;;
           *) PATH="$1${PATH:+:$PATH}";;
  esac
}

#prependpath $HOME/.local/bin
#prependpath $HOME/bin
#unset prependpath
#export PATH

appendpath(){
  case ":${PATH}:" in
  *":${1}:"*) ;;
  *         )  PATH="${PATH:+$PATH:}$1"
  esac
}

preparepath(){
for x in \
  "$HOME/bin" \
  "$HOME/.local/bin" \
  "$HOME/.cargo/bin" \
  "$HOME/go/bin" \
  "/usr/local/sbin" \
  "/usr/local/bin" \
  "/usr/bin" \
; do
  [ -d "$x" ] || continue
  appendpath $x
done
}
