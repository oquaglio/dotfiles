echo "Sourced: $(dirname "$0")/$(basename "$0")"

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

source_files $DOTFILES_ROOT/config .aliases


