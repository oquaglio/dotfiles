# cd to dir without cd
setopt AUTO_CD

# cd pushes old dir onto stack, use `cd -<TAB>` to pick from recent dirs
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT

# Globbing
setopt EXTENDED_GLOB        # Enable #, ~, ^ in glob patterns
setopt NO_CASE_GLOB         # Case-insensitive globbing

# Safety
setopt NO_CLOBBER           # Prevent > from overwriting files (use >| to force)

# History verification
setopt HIST_VERIFY          # Show expanded history command before running it

# Allow comments in interactive shell (useful for pasting snippets)
setopt INTERACTIVE_COMMENTS
