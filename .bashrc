# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

if [[ "$(uname)" == "Darwin" ]]; then
    export XDG_CONFIG_HOME="/Users/$USER/.config"
else
    export XDG_CONFIG_HOME="/home/$USER/.config"
fi

alias ledger='/opt/ledger-live-desktop-2.77.2-linux-x86_64.AppImage'

touch ~/.hushlogin
