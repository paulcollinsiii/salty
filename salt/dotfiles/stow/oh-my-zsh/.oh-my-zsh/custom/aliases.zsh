# Global Aliases
alias git='hub'

{%- if grains['os'] == 'Ubuntu' %}
# Aliases because Ubuntu us dumb at some things
alias tmux='tmux -2'
{% endif -%}
