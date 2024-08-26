echo "Sourced: $(dirname "$0")/$(basename "$0")"

# set up important stuff before proceeeding
source $(dirname "$0")/.init

echo -n "Creating symlinks... "
chmod +x $DOTFILES_ROOT/scripts/create_symlinks.sh && $DOTFILES_ROOT/scripts/create_symlinks.sh && echo "Done.";


#source_if_exists $DOTFILES_ROOT/.paths
#source_if_exists $DOTFILES_ROOT/.aliases
source_files $DOTFILES_ROOT/config .setup
source_files $DOTFILES_ROOT/config .aliases
source_files $DOTFILES_ROOT/config .functions
source_files $DOTFILES_ROOT/config .paths
source_files $DOTFILES_ROOT/config .env
source_files $DOTFILES_ROOT/config/functions "*"
#source_files $DOTFILES_ROOT .zsh

mkdir -p $DOTFILES_LOCAL_ROOT
source_files $DOTFILES_LOCAL_ROOT "*"

# finally, run any extra shell commands
source_if_exists $DOTFILES_ROOT/config/.shellrc