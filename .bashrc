#echo "Sourced: ${BASH_SOURCE[0]}"

export DOTFILES_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# set up important stuff before proceeeding
source $DOTFILES_ROOT/.init

chmod +x $DOTFILES_ROOT/scripts/create_symlinks.sh && $DOTFILES_ROOT/scripts/create_symlinks.sh

source $DOTFILES_ROOT/.sources
