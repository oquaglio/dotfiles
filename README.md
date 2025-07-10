# dotfiles

My dotfiles. I have stolen many ideas from other people's dotfiles.

I use zsh and things seem to work well. I also tested bash, but not very carefully.

## Example Prompt

<img src="https://github.com/user-attachments/assets/0c7cedfe-b8b1-471e-850c-34bacc675863" alt="terminal screenshot" width="800" />


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

3. Reload shell (will also create symbolic links)

4. Add to ~/.gitconfig for git setup:

```SH
[commit]
    template = ~/.gitmessage

[include]
    path = ~/.git_aliases

[core]
    excludesfile = ~/.gitignore
```

5. Add any custom files to source to this dir:

``` SH
~/.dotfiles-local
```

## Getting Updates

(These are aliases that have been added as part of these dotfiles)

Get latest updates from github and reload everything ("[up]date dotfiles"):

```SH
up
```

Re-run the shell (which will source the config) without getting updates from github ("[r]e[l]oad"):

```SH
rl
```

## Setup

Set up locales, e.g. Ubuntu:
```SH
sudo locale-gen $LANG
```
```SH
sudo update-locale LANG=$LANG
```

## Optional

I use starship prompt. Install it with your package manager and add it to your .rc file(s):

```SH
eval "$(starship init zsh)"
```

Also add this for the prompt:

```SH
export DISTRO_NAME="$WSL_DISTRO_NAME"
```

or:

```SH
export DISTRO_NAME="My Distro"
```

or:

```
export DISTRO_NAME=$(. /etc/os-release; echo $ID$VERSION_ID)
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
sudo -E zsh -c 'source $DOTFILES_ROOT/functions/file; sfch'
```

``` SH
sudo -E zsh -c 'source $DOTFILES_ROOT/functions/file; fch /'
```

## Testing

```SH
sudo -E bash -c '. $DOTFILES_ROOT/functions/_utils; set-x;  sfch'
bash -c 'source $DOTFILES_ROOT/.zshrc'
```

## Ref
https://github.com/p3rception/dotfiles



