# dotfiles

My dotfiles for Linux

## Setup

Clone:

``` SH
git clone https://github.com/oquaglio/dotfiles.git ~/.dotfiles
```

Create symlinks:

``` SH
.dotfiles/create_symlinks.sh
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
if [ -f ~/.env ]; then
    source ~/.env
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
