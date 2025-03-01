# ~/.profile wandsas 202502

# POSIX variables
# see http://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap08.html#tag_08_03
\: ${LANG:=en_US.UTF-8}
\: ${LC_COLLATE:=C}
\export LANG LC_COLLATE

\: ${SHELL:=bash}
\: ${PAGER:=less}
\: ${EDITOR:=vim}
\: ${VISUAL:=vim}
\: ${BROWSER:=chromium}
\export SHELL PAGER EDITOR VISUAL BROWSER

# XDG path variables
# see https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
\: ${XDG_CONFIG_HOME:=$HOME/.config}
\: ${XDG_CACHE_HOME:=$HOME/.cache}
\: ${XDG_DATA_HOME:=$HOME/.local/share}
\: ${XDG_RUNTIME_DIR:=/run/user/$(id -u)}
\export XDG_CONFIG_HOME XDG_CACHE_HOME XDG_DATA_HOME XDG_RUNTIME_DIR

# XDG system path variable
# see https://standards.freedesktop.org/icon-theme-spec/icon-theme-spec-latest.html
export XDG_DATA_DIRS=${XDG_DATA_HOME}:${XDG_DATA_DIRS:-/usr/local/share:/usr/share}


# Turnstile runit service
export SVDIR=$HOME/service

# Required for dbus
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=${XDG_SESSION_DESKTOP:-sway}
export XDG_SESSION_TYPE=${XDG_SESSION_TYPE=-wayland}
export XCURSOR_THEME=plan9
export XCURSOR_SIZE=24

export GOPATH=$HOME/go
export GCC_COLORS='error=01;31:warning=01;35:locus=01:quote=01:path=01;36'
export CCACHE_HOME=$XDG_CACHE_HOME/ccache
export MAKEOPTS='^-j$(($(getconf _NPROCESSORS_ONLN)+1)) --no-print-directory'


if [ -d ~/.profile.d ]; then
  for sh in ~/.profile.d/*.sh; do
    [ -r $sh ] && . $sh
  done
  unset sh
fi

[ -n $BASH_VERSION ] && [ -f ~/.bashrc ] && . ~/.bashrc
