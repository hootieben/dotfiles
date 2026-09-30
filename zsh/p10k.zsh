# Subtle single-line Powerlevel10k prompt.
#
# Starts from the bundled "lean" style (no backgrounds, no frame) and overrides
# a few settings below. The previous wizard-generated config is ~/.p10k.zsh.bak.
# `p10k configure` will overwrite this file.

source "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k/config/p10k-lean.zsh"

# One line: directory, git, prompt symbol.
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs prompt_char)

# Right side shows only when relevant: failed exit code, slow commands, jobs,
# active venv, non-default terraform workspace, aws/kube context while running
# aws/kubectl/terraform commands, user@host over ssh or as root.
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
  status
  command_execution_time
  background_jobs
  virtualenv
  terraform
  aws
  kubecontext
  context
)

typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

# Past prompts collapse to just "❯ command", so scrollback copies cleanly.
typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# No segment icons.
typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=

# Muted colours.
typeset -g POWERLEVEL9K_DIR_FOREGROUND=67
typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=74
typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=242
typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=108
typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=167
typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=244
