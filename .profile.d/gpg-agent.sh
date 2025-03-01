export GNOME_KEYRING_CONTROL="${XDG_RUNTIME_DIR}/keyring"
export GPG_TTY="$(tty)"
export GPG_AGENT_INFO="$(gpgconf --list-dir agent-socket)"
export SSH_AUTH_SOCK="$(gpgconf --list-dir agent-ssh-socket)"
unset SSH_AGENT_PID
gpg-connect-agent updatestartuptty /bye >/dev/null 2>&1
