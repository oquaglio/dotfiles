export DOTFILES_USER=oquaglio
export DOTFILES_DIR=$HOME/.dotfiles

for file in $(find $DOTFILES_DIR -type f -name "*.aliases"); do
    source $file
done

# Recursively source all .zsh files in the dotfiles directory
for file in $(find $HOME/.dotfiles -type f -name "*.zsh"); do
    source $file
done

if [ -f $HOME/.dotfiles/.env ]; then
    source $HOME/.dotfiles/.env
fi

if [ -f $HOME/.dotfiles/.setuprc ]; then
    source $HOME/.dotfiles/.setuprc
fi

if [ -f $HOME/.dotfiles/.shellrc ]; then
    source $HOME/.dotfiles/.shellrc
fi
