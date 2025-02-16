#!/bin/bash

echo "Linking dotfiles..."

sudo ln -sfn ~/dotfiles/dotfiles ~/.config/
sudo ln -sfn ~/.config/dotfiles/linux/nixos/configuration.nix /etc/nixos/configuration.nix

sudo rm -rf ~/.config/eww
sudo ln -sfn ~/dotfiles/eww ~/.config

sudo rm -rf ~/.config/mako ~/.config/rofi ~/.config/MangoHud ~/.config/sway ~/.config/swaylock ~/.config/nvim ~/.config/kitty
sudo ln -sfn ~/dotfiles/sway ~/.config
sudo ln -sfn ~/dotfiles/rofi ~/.config
sudo ln -sfn ~/dotfiles/MangoHud ~/.config
sudo ln -sfn ~/dotfiles/mako ~/.config
sudo ln -sfn ~/dotfiles/swaylock ~/.config
sudo ln -sfn ~/dotfiles/nvim ~/.config
sudo ln -sfn ~/dotfiles/kitty ~/.config
sudo ln -sfn ~/dotfiles/tmux ~/.config

