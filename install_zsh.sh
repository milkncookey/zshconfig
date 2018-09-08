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

# In case zsh is not installed yet, then why you tring to config
if ! type "zsh" > /dev/null; then
    while true; do
        read -p "Do you wish to install zsh? [Y/n]
" yn
        case $yn in
            Y ) sudo apt-get install zsh; set_sh_default; break;;
            * ) echo "Continuing without installing tmux"; break;;
        esac
    done
fi

