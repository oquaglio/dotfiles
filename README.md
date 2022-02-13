# dotfiles
Dot files for Linux

Clone:

git clone https://github.com/oquaglio/dotfiles.git ~/.dotfiles

Then, run:

.dotfiles/create_symlinks.sh


# BASH Setup

Add the following to .bashrc:

if [ -f ~/.bash_env ]; then
    source ~/.bash_env
fi


# ZSH Setup

Add the following to .zshrc:

if [ -f ~/.env ]; then
    source ~/.env
fi
