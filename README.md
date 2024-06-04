# dotfiles

My dotfiles for Linux.


## Get the dotfiles

Clone:

``` SH
git clone https://github.com/oquaglio/dotfiles.git ~/.dotfiles
~/.dotfiles/create_symlinks.sh
```

## Git Setup

Add to ~/.gitconfig:

```SH
[include]    
    path = ~/dotfiles/.gitconfig
```

## BASH Setup

Add the following to .bashrc:

``` SH
if [ -f ~/.bash_env ]; then
    source ~/.bash_env
fi
```

## ZSH Setup

Add the following to .zshrc:

``` SH
if [ -f $HOME/.dotfiles/.aliases ]; then
    source $HOME/.dotfiles/.aliases
fi

# Source global environment variables
if [ -f "$HOME/.dotfiles/.env" ]; then
    source "$HOME/.dotfiles/.env"
fi
```

## Update dotfiles and and Reload env

Alias for this:
```SH
updot
```

## Using fch Function

Before changes:
``` SH
sudo bash -c 'source /home/otto/.dotfiles/.aliases; sfch'
```

Capture changes:
``` SH
sudo bash -c 'source /home/otto/.dotfiles/.aliases; fch /'
```

``` SH
sudo bash -c 'source /home/otto/.dotfiles/.aliases; fch /home/otto'
```
