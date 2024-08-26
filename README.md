# dotfiles

I maintain this repo as *my* dotfiles.

I presently use zsh and that's all I've tested for.

I have stolen many ideas from other people's dotfiles.


## Installation

Clone:

``` SH
git clone --depth 1 --branch master https://github.com/oquaglio/dotfiles.git $HOME/.dotfiles >/dev/null;
```

Add the following to .zshrc:

``` SH
if [ -f $HOME/.dotfiles/.zshrc ]; then
    source $HOME/.dotfiles/.zshrc
fi
```

Add to ~/.gitconfig for git setup:

```SH
[include]    
    path = ~/.dotfiles/.gitconfig
```

Any files in this dir will also be sourced, so make use of it if you need to add any local config:

``` SH
~/.dotfiles-local
```

## Getting Updates

Get latest updates from github and reload everything ("update dotfiles"):

```SH
updot
```

Just reload without getting updates from github ("reload"):

```SH
rl
```

## How-Tos

## Using the fch Function

This function scans your disk for file changes.

Run before changes (capture current timestamp):
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
