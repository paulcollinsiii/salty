# Global Aliases
alias vim=nvim

{%- if ansible_os_family == 'Ubuntu' %}
# Aliases because Ubuntu is dumb at some things
alias tmux='tmux -2'
{% endif -%}
