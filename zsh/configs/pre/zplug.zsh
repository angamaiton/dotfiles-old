# Add zplug to path
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# ============================================================================
# Plugins
# ============================================================================

zplug "mafredri/zsh-async", defer:0

# Miscellaneous
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:3
zplug "zsh-users/zsh-autosuggestions", defer:3

# Theme
# zplug "denysdovhan/spaceship-zsh-theme", as:theme, defer:3
# zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme, defer:3
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug "plugins/colored-man-pages", from:oh-my-zsh

# Check for uninstalled plugins.
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi

# Source plugins.
zplug load
