# dotfiles

My dotfiles for Linux.


## Setup

Clone:

``` SH
git clone https://github.com/oquaglio/dotfiles.git ~/.dotfiles
```

Create symlinks:

``` SH
.dotfiles/create_symlinks.sh
```

Create ~/.gitconfig with your env specific stuff, e.g.:

```SH
[user]
	email = <email>
	name = <user>

[include]
    path = ~/.git_aliases
    path = ~/.gitconfig_custom
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

if [ -f $HOME/.dotfiles/.env ]; then
    source $HOME/.dotfiles/.env
fi
```

Add to ~/.profile (to expose to)

```SH
# if running zshrc
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zschrc" ]; then
    . "$HOME/.bashrc"
    fi
fi
```


## Refresh

Pull from github (or fetch & merge etc):

``` SH
git pull
```

Source the changes:

``` SH
. ~/.profile
```

Source aliases:

``` SH
. ~/.aliases
```

## Using fch Function

Before changes:
``` SH
sudo bash -c 'source /home/otto/.aliases; sfch'
```

Capture changes:
``` SH
sudo bash -c 'source /home/otto/.aliases; fch /'
```

``` SH
sudo bash -c 'source /home/otto/.aliases; fch /home/otto'
```
