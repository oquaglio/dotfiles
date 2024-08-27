#echo "Sourced: ${BASH_SOURCE[0]}"

export DOTFILES_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)

# set up important stuff before proceeeding
source $DOTFILES_ROOT/.init

source $DOTFILES_ROOT/.sources
