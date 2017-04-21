# Global Aliases
alias git='hub'
alias update_ssh_config='{{ pillar['default_home'] }}/.pyenv/versions/salt2/bin/python {{ pillar['default_home'] }}/workspace/salt_infra/scripts/local_utils/aws_ssh_config_builder.py --filename {{ pillar['default_home'] }}/.ssh/config --region us-east-1 paul.collins --profiles bslegacy datanav dol interactive mm si prodops'

{%- if grains['os'] == 'Ubuntu' %}
# Aliases because Ubuntu us dumb at some things
alias tmux='tmux -2'
{% endif -%}
