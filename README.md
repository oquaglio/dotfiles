# dotfiles

My dotfiles for Linux.


## Inital Setup

Clone:

``` SH
git clone https://github.com/oquaglio/dotfiles.git ~/.dotfiles
```

Create symlinks:

``` SH
.dotfiles/create_symlinks.sh
```

Add to ~/.gitconfig:

```SH
[include]
    path = ~/.gitconfig.custom
```

Update ~/.env.local with any local-only config, e.g.:


## Updates

```SH
updot
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

# Source local environment variables, which will override the global ones if they exist
if [ -f "$HOME/.local.env" ]; then
    source "$HOME/.env.local"
fi
```

## Refresh

Alias for this:
```SH
updot
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
