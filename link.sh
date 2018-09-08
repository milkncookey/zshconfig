#!/bin/bash
set -euox pipefail

BACKUP_DIR=/tmp/dotconfig_backup/zshconfig
DIR="$(cd "$(dirname "$0")"; pwd -P)"

$DIR/install_zsh.sh

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR
[ -e ~/.oh-my-zsh ] && mv ~/.oh-my-zsh $BACKUP_DIR
[ -e ~/.zshrc ]     && mv ~/.zshrc $BACKUP_DIR
ln -sf $DIR/oh-my-zsh ~/.oh-my-zsh
ln -sf $DIR/zshrc ~/.zshrc
