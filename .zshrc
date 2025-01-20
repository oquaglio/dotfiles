#echo "Sourced: $(dirname "$0")/$(basename "$0")"

export DOTFILES_ROOT=$(dirname "$0")

# set up important stuff before proceeding
source $DOTFILES_ROOT/.init

source $DOTFILES_ROOT/.sources
