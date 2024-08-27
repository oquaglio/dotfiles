echo ${0}
DOTFILES_ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)
echo $DOTFILES_ROOT

# Init some important stuff before proceeeding
#INIT_PATH="$(dirname "$(readlink -f "$0")")/.init"
INIT_PATH="$DOTFILES_ROOT/.init"

if [ -f "$INIT_PATH" ]; then
    source "$INIT_PATH"
else
    echo "Initialization file not found: $INIT_PATH"
    exit 1
fi

chmod +x $DOTFILES_ROOT/scripts/create_symlinks.sh && $DOTFILES_ROOT/scripts/create_symlinks.sh

echo -n "Sourcing config... "
#source_if_exists $DOTFILES_ROOT/.paths
#source_if_exists $DOTFILES_ROOT/.aliases
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
echo "Done."
