echo "Sourced: $DOTFILES_ROOT/$(basename "$0")"

# important stuff before proceeeding
source $DOTFILES_ROOT/.env
source $DOTFILES_ROOT/.functions

# source dotfiles
source_files $DOTFILES_ROOT .aliases
source_files $DOTFILES_ROOT/functions "*"
#source_files $DOTFILES_ROOT .zsh

# source any file in local
mkdir -p $DOTFILES_LOCAL_ROOT
source_files $DOTFILES_LOCAL_ROOT "*"

# finally, run any extra shell commands
#source_if_exists $DOTFILES_ROOT/.shellrc
