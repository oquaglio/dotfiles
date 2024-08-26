#!/bin/bash

# Remove aliases first
rm -rf ~/.nanorc; rm -rf ~/.nano; rm -rf ~/.vimrc; rm -rf ~/.env; rm -rf ~/.aliases;

ln -sf $DOTFILES_ROOT/config/starship/starship.toml ~/.config/starship.toml
ln -sf $DOTFILES_ROOT/config/nano/.nanorc ~/.nanorc

#ln -sf $DOTFILES_ROOT/.nano ~/.nano
#ln -sf $DOTFILES_ROOT/.vimrc ~/.vimrc

#ln -sf $DOTFILES_ROOT/.aliases ~/.aliases
#ln -sf $DOTFILES_ROOT/.bash_env ~/.bash_env
#ln -sf $DOTFILES_ROOT/.env ~/.env
#ln -sf $DOTFILES_ROOT/.gitconfig.custom ~/.gitconfig.custom
#ln -sf $DOTFILES_ROOT/.gitmessage ~/.gitmessage
#ln -sf $DOTFILES_ROOT/.gitignore ~/.gitignore
#ln -sf $DOTFILES_ROOT/.git_aliases ~/.git_aliases


