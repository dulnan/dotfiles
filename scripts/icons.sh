#!/bin/bash


# Replace Telegram tray icons
rm -rf ~/.local/share/TelegramDesktop/tdata/ticons
cp -ar ~/dotfiles/scripts/icons/ticons ~/.local/share/TelegramDesktop/tdata/ticons