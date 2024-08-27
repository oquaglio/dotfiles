echo "Sourced: $(dirname "$0")/$(basename "$0")"

# set up important stuff before proceeeding
source $(dirname "$0")/.init

INIT_PATH="$(dirname "$(readlink -f "$0")")/.init"
if [ -f "$INIT_PATH" ]; then
    source "$INIT_PATH"
else
    echo "Initialization file not found: $INIT_PATH"
    exit 1
fi



