# for autocompletion
if command -v kubectl &> /dev/null; then
    source <(kubectl completion zsh)
else
    echo "kubectl not available: cannot enable autocompletion"
fi
