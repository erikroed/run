# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Include scripts folder
if [ -d "$HOME/.local/scripts" ]; then
    PATH="$HOME/.local/scripts:$PATH"
fi

__ssh_agent_socket="${XDG_RUNTIME_DIR:-/run/user/$(id -u)}/ssh-agent.socket"
if [ -S "$__ssh_agent_socket" ]; then
    export SSH_AUTH_SOCK="$__ssh_agent_socket"

    if ! ssh-add -l > /dev/null 2>&1; then
        __gitconfig_env="${XDG_CONFIG_HOME:-$HOME/.config}/run/gitconfig.env"
        if [ -r "$__gitconfig_env" ]; then
            __ssh_key="$HOME/.ssh/$(. "$__gitconfig_env"; echo "$SSH_KEY")"
            [ -f "$__ssh_key" ] && ssh-add -q "$__ssh_key"
            unset __ssh_key
        fi
        unset __gitconfig_env
    fi
fi
unset __ssh_agent_socket
