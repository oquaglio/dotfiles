echo "Sourced: $(dirname "$0")/$(basename "$0")"

# important stuff before proceeeding
source $(dirname "$0")/.env
source $DOTFILES_ROOT/.functions

# source any file in local
mkdir -p $DOTFILES_LOCAL_ROOT
source_files $DOTFILES_LOCAL_ROOT "*"

# source dotfiles
source_files $DOTFILES_ROOT .paths
source_files $DOTFILES_ROOT .aliases
source_files $DOTFILES_ROOT/docker "*"
source_files $DOTFILES_ROOT/functions "*"
source_files $DOTFILES_ROOT/git "*"
#source_files $DOTFILES_ROOT .zsh

# finally, run any extra shell commands
source_if_exists $DOTFILES_ROOT/.shellrc
