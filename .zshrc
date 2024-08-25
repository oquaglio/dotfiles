export DOTFILES_ROOT=$(dirname "$0")
echo "Sourced: $DOTFILES_ROOT/$(basename "$0")..."

if [ -f $DOTFILES_ROOT/dotfiles.cfg ]; then
    source $DOTFILES_ROOT/dotfiles.cfg
else
    echo "Error: $DOTFILES_ROOT/dotfiles.cfg does not exist or cannot be sourced." >&2
    exit 1  # Exit the script with a status of 1
fi

source $DOTFILES_ROOT/functions/_utils
source_files $DOTFILES_ROOT .functions
source_files $DOTFILES_ROOT .aliases
source_files $DOTFILES_ROOT/functions *
source_files $DOTFILES_ROOT .zsh
source_files $DOTFILES_ROOT .env

source_if_exists $DOTFILES_ROOT/neovim/.setup
source_if_exists $DOTFILES_ROOT/.shellrc
