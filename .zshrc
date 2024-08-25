export DOTFILES_USER=oquaglio
export DOTFILES_DIR=$HOME/.dotfiles

if [ -f ./dotfiles.cfg ]; then
    source ./dotfiles.cfg
else
    echo "Error: dotfiles.cfg does not exist or cannot be sourced."
fi

for file in $(find $DOTFILES_DIR -type f -name "*.aliases"); do
    source $file
done

for file in $(find $DOTFILES_DIR -type f -name "*.zsh"); do
    source $file
done

for file in $(find $DOTFILES_DIR -type f -name "*.env"); do
    source $file
done

if [ -f $HOME/.dotfiles/.setuprc ]; then
    source $HOME/.dotfiles/.setuprc
fi

if [ -f $HOME/.dotfiles/.shellrc ]; then
    source $HOME/.dotfiles/.shellrc
fi
