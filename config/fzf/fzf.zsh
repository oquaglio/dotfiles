# Load fzf key-bindings + completion for zsh.
# Stops after the first hit so apt+brew double-installs don't double-bind.

for _fzf_kb in \
    /usr/share/doc/fzf/examples/key-bindings.zsh \
    /usr/share/fzf/key-bindings.zsh \
    "$HOME/.fzf/shell/key-bindings.zsh"; do
    if [ -r "$_fzf_kb" ]; then
        source "$_fzf_kb"
        break
    fi
done

for _fzf_cmp in \
    /usr/share/doc/fzf/examples/completion.zsh \
    /usr/share/fzf/completion.zsh \
    "$HOME/.fzf/shell/completion.zsh"; do
    if [ -r "$_fzf_cmp" ]; then
        source "$_fzf_cmp"
        break
    fi
done

# Homebrew location (resolved only if brew is present).
if [ -z "$_fzf_kb" ] && command -v brew >/dev/null 2>&1; then
    _fzf_prefix=$(brew --prefix 2>/dev/null)
    [ -r "$_fzf_prefix/opt/fzf/shell/key-bindings.zsh" ] && source "$_fzf_prefix/opt/fzf/shell/key-bindings.zsh"
    [ -r "$_fzf_prefix/opt/fzf/shell/completion.zsh" ] && source "$_fzf_prefix/opt/fzf/shell/completion.zsh"
    unset _fzf_prefix
fi
unset _fzf_kb _fzf_cmp
