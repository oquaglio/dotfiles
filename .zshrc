#echo "Sourced: $(dirname "$0")/$(basename "$0")"

# Make sure compinit is loaded if not already
if ! whence -w compdef > /dev/null; then
    # dedup fpath array
    typeset -U fpath
    autoload -U compinit && compinit
fi

export DOTFILES_ROOT=$(dirname "$0")

# set up important stuff before proceeding
source $DOTFILES_ROOT/.init

source $DOTFILES_ROOT/.sources
