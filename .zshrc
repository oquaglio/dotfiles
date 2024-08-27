#echo "Sourced: $(dirname "$0")/$(basename "$0")"

export DOTFILES_ROOT=$(dirname "$0")

# set up important stuff before proceeeding
source $DOTFILES_ROOT/.init

chmod +x $DOTFILES_ROOT/scripts/create_symlinks.sh && $DOTFILES_ROOT/scripts/create_symlinks.sh

source $DOTFILES_ROOT/.sources

