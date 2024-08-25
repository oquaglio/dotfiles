# dotfiles

I maintain this repo as *my* dotfiles.

I use zsh and these presently customized thusly.

## Get the dotfiles

Clone:

``` SH
git clone --depth 1 --branch master https://github.com/oquaglio/dotfiles.git /home/$USER/.dotfiles >/dev/null;
```

## Git Setup

Add to ~/.gitconfig:

```SH
[include]    
    path = ~/dotfiles/.gitconfig
```

## Shell Setup

Add the following to .zshrc:

``` SH
if [ -f $HOME/.dotfiles/.zshrc ]; then
    source $HOME/.dotfiles/.zshrc
fi
```

Add the following to .bashrc:

``` SH
if [ -f ~/.bash_env ]; then
    source ~/.bash_env
fi
```

## Update dotfiles and and Reload env

```SH
updot
```

## Using fch Function

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
