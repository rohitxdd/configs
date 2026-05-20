#!/usr/bin/env bash
set -e

TPM_DIR="$HOME/.tmux/plugins/tpm"
CONFIG_DIR="$(dirname "$0")/configs"
BACKUP_DIR="$PWD/backups/tmux"

if [ ! -d "$TPM_DIR" ]; then
    echo "Cloning Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

mkdir -p "$BACKUP_DIR"

if [ -f "$HOME/.tmux.conf" ]; then
    cp "$HOME/.tmux.conf" "$BACKUP_DIR/tmux.conf.$(date +%Y%m%d-%H%M%S)"
else
    echo "No existing .tmux.conf to backup"
fi

if [ -f "$CONFIG_DIR/.tmux.conf" ]; then
    cp "$CONFIG_DIR/.tmux.conf" "$HOME/.tmux.conf"
    echo "tmux config restored"
else
    echo "Missing .tmux.conf in configs folder"
fi