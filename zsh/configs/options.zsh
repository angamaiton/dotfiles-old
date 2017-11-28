# ============================================================================
# Options
# ============================================================================

# Changing directories
setopt AUTO_PUSHD
setopt AUTO_CD
setopt PUSHD_IGNORE_DUPS
setopt PUSHD_SILENT
setopt PUSHD_MINUS
setopt CDABLEVARS

# Completion
setopt AUTO_LIST
setopt AUTO_MENU
setopt NO_COMPLETE_ALIASES

# Expansion and globbing
setopt EXTENDED_GLOB

# History
setopt APPEND_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# I/O
setopt ALIASES
setopt AUTO_PARAM_SLASH
setopt CORRECT

# Prompt
setopt PROMPT_SUBST

# Shell emulation
setopt INTERACTIVE_COMMENTS

# zle
setopt NO_BEEP
setopt VI

# ============================================================================
# Keybindings
# ============================================================================

# Give us access to ^Q
stty -ixon

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode

# Handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"