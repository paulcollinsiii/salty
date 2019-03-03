# Custom config for various plugins that have been installed etc
# PyENV settings
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


{%- if grains['os'] == 'Darwin' %}
  # Because fuckyou Terminal.app
  stty -ixon -ixoff

  # VI Mode but I still want my damn ctrl-r
  bindkey '^R' history-incremental-pattern-search-backward

  # Because some modes are still not correct for vi-mode
  export KEYTIMEOUT=1
  bindkey '^w' backward-kill-word
  bindkey '^e' end-of-line
  bindkey '^a' beginning-of-line
{% endif -%}

