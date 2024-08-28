# dotfiles

I maintain this repo as *my* dotfiles.

I presently use zsh and things seem to work well. I also tested bash, but not very carefully.

I have stolen many ideas from other people's dotfiles.


## Installation

1. Clone:

``` SH
git clone --depth 1 --branch master https://github.com/oquaglio/dotfiles.git $HOME/.dotfiles >/dev/null;
```

2. Add the following to .rc files:

``` SH
if [ -f $HOME/.dotfiles/.zshrc ]; then
    source $HOME/.dotfiles/.zshrc
fi
```

``` SH
if [ -f $HOME/.dotfiles/.bashrc ]; then
    source $HOME/.dotfiles/.bashrc
fi
```

3. Reload shell

4. Add to ~/.gitconfig for git setup:

```SH
[commit]
    template = ~/.dotfiles/config/git/.gitmessage

[include]
    path = ~/.dotfiles/config/git/.git_aliases

[core]
    excludesfile = ~/.dotfiles/config/git/.gitignore
```

5. Add any custom files to source to this dir:

``` SH
~/.dotfiles-local
```

## Getting Updates

Get latest updates from github and reload everything ("[up]date dotfiles"):

```SH
up
```

Re-run the shell (which will source the config) without getting updates from github ("[r]e[l]oad"):

```SH
rl
```

## Optional

I use starship prompt. Install it with your package manager and add it to your .rc file(s):

```SH
eval "$(starship init zsh)"
```

## How-Tos

### Using the fch Function

This function scans your disk for file changes.

If you just want to check your home dir:

1. Run before changes (captures current timestamp):
``` SH
sfch
```

2. Do your things that result in files changes...

3. Check the files that changed:
```SH
fch
```

If you want to check the root dir (/), you need to run with sudo:
(But, sudo doesn't have any of our dotfiles, so first we source them manually)

``` SH
sudo -E zsh -c 'source $DOTFILES_ROOT/functions/_utils; sfch'
```

``` SH
sudo -E zsh -c 'source $DOTFILES_ROOT/functions/_utils; fch /'
```

## Testing

```SH
sudo -E bash -c '. $DOTFILES_ROOT/functions/_utils; set-x;  sfch'
bash -c 'source $DOTFILES_ROOT/.zshrc'
```


