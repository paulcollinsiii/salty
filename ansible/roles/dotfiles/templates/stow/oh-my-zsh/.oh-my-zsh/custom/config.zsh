# Custom config for various plugins that have been installed etc
# PyENV settings
export PYENV_VIRTUALENV_DISABLE_PROMPT=1


{%- if ansible_os_family == 'MacOS' %}
  # Because Terminal.app why you have bad defaults
  stty -ixon -ixoff
{% endif -%}
