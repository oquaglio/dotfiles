#!/bin/bash

echo -n "Creating symlinks... "

# Set up dirs
mkdir -p ~/.config

# Remove only existing symlinks at the targets we manage, so we never clobber
# a real file the user may have put there (e.g. a hand-written ~/.env).
_unlink_if_symlink() {
    for target in "$@"; do
        if [ -L "$target" ]; then
            rm -f "$target"
        fi
    done
}
_unlink_if_symlink ~/.nanorc ~/.nano ~/.config/nano \
                   ~/.config/starship.toml \
                   ~/.gitmessage ~/.gitignore ~/.git_aliases
unset -f _unlink_if_symlink

# Create symlinks to app specific config
ln -sf $DOTFILES_ROOT/config/starship/starship.toml ~/.config/starship.toml
ln -sf $DOTFILES_ROOT/config/nano/.nanorc ~/.nanorc
# TODO: fix nano config
ln -sf "$DOTFILES_ROOT/config/nano/.nano" ~/.nano
ln -sf "$DOTFILES_ROOT/config/nano/.nano" ~/.config/nano

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
