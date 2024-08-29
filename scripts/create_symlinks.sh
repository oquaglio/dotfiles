#!/bin/bash

echo -n "Creating symlinks... "

# Remove aliases first
rm -rf ~/.nanorc; rm -rf ~/.nano; rm -rf ~/.vimrc; rm -rf ~/.env; rm -rf ~/.aliases;

ln -sf $DOTFILES_ROOT/config/starship/starship.toml ~/.config/starship.toml
ln -sf $DOTFILES_ROOT/config/nano/.nanorc ~/.nanorc

# .gitconfig doesn't support env vars, so instead link them to $HOME
ln -sf $DOTFILES_ROOT/config/git/.gitmessage $HOME/.gitmessage
ln -sf $DOTFILES_ROOT/config/git/.gitignore $HOME/.gitignore
ln -sf $DOTFILES_ROOT/config/git/.git_aliases $HOME/.git_aliases

#ln -sf $DOTFILES_ROOT/.nano ~/.nano
#ln -sf $DOTFILES_ROOT/.vimrc ~/.vimrc

#ln -sf $DOTFILES_ROOT/.aliases ~/.aliases
#ln -sf $DOTFILES_ROOT/.bash_env ~/.bash_env
#ln -sf $DOTFILES_ROOT/.env ~/.env
#ln -sf $DOTFILES_ROOT/.gitconfig.custom ~/.gitconfig.custom



echo "Done.";
