#echo "Sourced: $(dirname "$0")/$(basename "$0")"

# Initial setup ###############################################################

export DOTFILES_ROOT=$(dirname "$0")

# set up important stuff before proceeding
source $DOTFILES_ROOT/.init

# Zsh specific vars

# The dir I use for zsh plugins
export ZSH_PLUGINS_DIR=$HOME/.zsh/plugins
mkdir -p $ZSH_PLUGINS_DIR


# Source Zsh plugins (that install completions) ###############################

source_if_exists "$ZSH_PLUGINS_DIR/zsh-completions/zsh-completions.plugin.zsh"
#fpath=("$ZSH_PLUGINS_DIR/zsh-completions" $fpath)

#export ZSHZ_CMD=z
source_if_exists "$ZSH_PLUGINS_DIR/zsh-z/zsh-z.plugin.zsh"


# Load Zsh completions ########################################################

# Ensure Zsh's completion system is initialized, but only if it hasn't been already.
# `compinit` scans the directories listed in $fpath and sets up command completion.
# This must run **after** all plugins that modify $fpath (e.g. zsh-completions),
# otherwise their completions will not be registered.
# `compdef` is a key function defined by compinit — we check for it to avoid reinitialization.

if ! whence -w compdef > /dev/null; then
    # Deduplicate $fpath to avoid warnings or redundant scanning
    typeset -U fpath
    autoload -Uz compinit
    compinit
fi


# Source my source files ######################################################

# Some commands and aliases may require compdef command
source $DOTFILES_ROOT/.sources


# Plugins and Common Zsh settings #############################################

# Skip sourcing the below config if it has already been loaded
# if [[ -n "$DOTFILES_ZSHRC_LOADED" ]]; then
#   return
# fi
echo "Setting up Zsh plugins and common settings..."


# Starship ####################################################################

# The following is to handle the error I get with vi mode editing
# avoid re‑wrapping the keymap‐select widget endlessly
# (clears it if it’s already been bound to Starship’s functions)
local _widget=${widgets[zle-keymap-select]#user:}
if [[ $_widget == starship_zle-keymap-select || \
      $_widget == starship_zle-keymap-select-wrapped ]]; then
  zle -N zle-keymap-select ""
fi

# now (re)initialize Starship
eval_if_exists starship init zsh


# Zsh plugins #################################################################

# Source other Zsh plugins that don't use autocompletions
source_if_exists "$ZSH_PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
#source_if_exists "$ZSH_PLUGINS_DIR/zsh-you-should-use/you-should-use.plugin.zsh"

# Zsh plugin that must be sourced last
source_if_exists "$ZSH_PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"

# --- Completion Visual Enhancements ---
zstyle ':completion:*' menu select # fancy menus for zsh-z
zstyle ':completion:*' matcher-list \
  'm:{a-z}={A-Za-z}' \
  'r:|[._-]=* r:|=*'


# Pipx ########################################################################

# Enable bash completion in zsh if not already initialized
# For bash-style autocompletions (needed by: pipx)
if ! whence -w _bash_complete &>/dev/null; then
  autoload -U bashcompinit
  bashcompinit
fi

if command -v register-python-argcomplete >/dev/null 2>&1; then
  eval "$(register-python-argcomplete pipx)"
fi


# Node.js Version Manager #####################################################

# Set up NVM if exists
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


# Nix #########################################################################

# Load Nix environment if it exists
# if [ -e /home/otto/.nix-profile/etc/profile.d/nix.sh ]; then
#   . /home/otto/.nix-profile/etc/profile.d/nix.sh
# fi
source_if_exists $HOME/.nix-profile/etc/profile.d/nix.sh


# Other plugins ###############################################################

# A command history database. Press up arrow to use.
eval_if_exists atuin init zsh

# direnv hook
eval_if_exists direnv hook zsh



# Pyenv
#eval_if_exists pyenv init -


# Key bindings ##############################################################

# pick Emacs‑style (-e) or Vi-style (-v) editing
#bindkey -e
setup_terminal_keys


# Finally #####################################################################

export DOTFILES_ZSHRC_LOADED=$(( ${DOTFILES_ZSHRC_LOADED:-0} + 1 ))
echo "DOTFILES_ZSHRC_LOADED = $DOTFILES_ZSHRC_LOADED"
