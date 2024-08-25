echo "Reloading $(dirname "$0")/$(basename "$0")..."
export DOTFILES_USER=oquaglio
#export DOTFILES_ROOT=$HOME/.dotfiles
export DOTFILES_ROOT=$(dirname "$0")/
#cd "$(dirname "$0")/.."
#DOTFILES_ROOT=$(pwd -P)

for file in $(find $DOTFILES_ROOT -type f -name "*.aliases"); do
    source $file
done

for file in $(find $DOTFILES_ROOT -type f -name "*.zsh"); do
    source $file
done

for file in $(find $DOTFILES_ROOT -type f -name "*.env"); do
    source $file
done

if [ -f $HOME/.dotfiles/.setuprc ]; then
    source $HOME/.dotfiles/.setuprc
fi

if [ -f $HOME/.dotfiles/.shellrc ]; then
    source $HOME/.dotfiles/.shellrc
fi
