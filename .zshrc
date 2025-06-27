#echo "Sourced: $(dirname "$0")/$(basename "$0")"

# Make sure Zsh's autocompletion system is loaded if not already
if ! whence -w compdef > /dev/null; then
    # dedup fpath array (dirs Zsh searches for functions like compinit)
    typeset -U fpath
    #autoload -U compinit && compinit
    autoload -Uz compinit
    compinit
fi

export DOTFILES_ROOT=$(dirname "$0")

# set up important stuff before proceeding
source $DOTFILES_ROOT/.init

source $DOTFILES_ROOT/.sources

# Zsh specific vars

# The dir I use for zsh plugins
export ZSH_PLUGINS_DIR=$HOME/.zsh/plugins
mkdir -p $ZSH_PLUGINS_DIR

# TODO: Add plugin sources and config

# TODO: Add other common stuff
