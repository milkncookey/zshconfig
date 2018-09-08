#!/bin/bash
set -euox pipefail

BACKUP_DIR=/tmp/dotconfig_backup/zshconfig
DIR="$(cd "$(dirname "$0")"; pwd -P)"

$DIR/install_zsh.sh

rm -rf $BACKUP_DIR
mkdir -p $BACKUP_DIR
[ -e ~/.oh_my_zsh ] && mv ~/.oh_my_zsh $BACKUP_DIR
[ -e ~/.zshrc ]     && mv ~/.zshrc $BACKUP_DIR
ln -sf $DIR/oh_my_zsh ~/.oh_my_zsh
ln -sf $DIR/zshrc ~/.zshrc
