#echo "Sourced: $(dirname "$0")/$(basename "$0")"

export DOTFILES_ROOT=$(dirname "$0")

# set up important stuff before proceeding
source $DOTFILES_ROOT/.init

start_time=$(date +%s)  # Record start time
source $DOTFILES_ROOT/.sources
end_time=$(date +%s)    # Record end time
# Calculate the elapsed time and print it
elapsed=$(( end_time - start_time ))
echo "Sourcing took $elapsed seconds."
