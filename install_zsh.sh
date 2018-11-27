#!/bin/bash
set -uox pipefail

# Change the default terminal to be zsh
set_sh_default()
{
    while true; do
        read -p "Do you wish to change default shell to zsh? [Y/n]
" yn
        case $yn in
            Y ) chsh -s /bin/zsh; break;;
            * ) echo "Continuing without setting zsh to default"; break;;
        esac
    done
}

# In case zsh is not installed yet, ask to install it
if ! type "zsh" > /dev/null; then
    while true; do
        read -p "Do you wish to install zsh? [Y/n]
" yn
        case $yn in
            Y ) sudo apt-get install zsh; break;;
            * ) echo "Continuing without installing tmux"; break;;
        esac
    done
fi

# If zsh is installed, ask to set shell default to zsh
if type "zsh" > /dev/null; then
    set_sh_default
fi
