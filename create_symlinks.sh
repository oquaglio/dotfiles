#!/bin/bash

# Remove aliases first
rm -rf ~/.nanorc; rm -rf ~/.nano; rm -rf ~/.vimrc; rm -rf ~/.env; rm -rf ~/.aliases;

ln -sf ~/.dotfiles/.config/starship.toml ~/.config/starship.toml
ln -sf ~/.dotfiles/.nanorc ~/.nanorc
#ln -sf ~/.dotfiles/.nano ~/.nano
#ln -sf ~/.dotfiles/.vimrc ~/.vimrc

#ln -sf ~/.dotfiles/.aliases ~/.aliases
#ln -sf ~/.dotfiles/.bash_env ~/.bash_env
#ln -sf ~/.dotfiles/.env ~/.env
#ln -sf ~/.dotfiles/.gitconfig.custom ~/.gitconfig.custom
#ln -sf ~/.dotfiles/.gitmessage ~/.gitmessage
#ln -sf ~/.dotfiles/.gitignore ~/.gitignore
#ln -sf ~/.dotfiles/.git_aliases ~/.git_aliases


