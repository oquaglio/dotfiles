if [ -f $HOME/.dotfiles/.aliases ]; then
    source $HOME/.dotfiles/dotfiles.cfg
fi

if [ -f $HOME/.dotfiles/.aliases ]; then
    source $HOME/.dotfiles/.aliases
fi

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
