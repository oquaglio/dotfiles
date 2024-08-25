# dotfiles

I maintain this repo as *my* dotfiles.

I presently use zsh and hence have only tested for zsh. One day, I will get around to adding for bash.

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

Get latest updates from github and reload everything ("update dotfiles"):

```SH
updot
```


Just reload without getting updates from github ("reload"):

```SH
rl
```


## Git Setup

Add to ~/.gitconfig:

```SH
[include]    
    path = ~/.dotfiles/.gitconfig
```


## Handy Ref

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
