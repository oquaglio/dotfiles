export DOTFILES_ROOT=$(dirname "$0")
echo "Reloading $DOTFILES_ROOT/$(basename "$0")..."

if [ -f $DOTFILES_ROOT/dotfiles.cfg ]; then
    source $DOTFILES_ROOT/dotfiles.cfg
else
    echo "Error: $DOTFILES_ROOT/dotfiles.cfg does not exist or cannot be sourced." >&2
    exit 1  # Exit the script with a status of 1
fi

for file in $(find $DOTFILES_ROOT -type f -name "*.aliases"); do
    source $file
done

for file in $(find $DOTFILES_ROOT/functions -type f -name "*"); do
    source $file
done

# put any zsh-only compatbile stuff in .zsh files...
for file in $(find $DOTFILES_ROOT -type f -name "*.zsh"); do
    source $file
done

# depends on pathadd alias
for file in $(find $DOTFILES_ROOT -type f -name "*.env"); do
    source $file
done

if [ -f $DOTFILES_ROOT/neovim/.setup ]; then
    source $DOTFILES_ROOT/neovim/.setup
fi

if [ -f $DOTFILES_ROOT/.shellrc ]; then
    source $DOTFILES_ROOT/.shellrc
fi
