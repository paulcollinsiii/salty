include:
  - packages

dotfiles:
  file.recurse:
    - name: {{ pillar['default_home'] }}/stow
    - source: salt://{{ tpldir }}/stow
    - user: {{ pillar['default_user'] }}
    - group: {{ pillar['default_group'] }}
    - file_mode: 400
    - template: jinja

{% set modules = [
  'git',
  'nvim',
  'powerline',
  'oh-my-zsh',
  'tmux',
  'vim',
  'zsh',
] %}

{% if grains['os'] != 'MacOS' %}
{% do modules.append('npm') %}
{% endif %}


{{ pillar['default_home']}}/.config:
  file.directory:
    - user: {{ pillar['default_user'] }}
    - group: {{ pillar['default_group'] }}

stow:
  pkg.installed:
    - name: stow
  cmd.run:
    - name: "stow -t {{ pillar['default_home'] }} -S {{ modules | join(' -S ') }}"
{% if grains['os'] not in ('FreeBSD', 'MacOS') %}
    - runas: {{ pillar['default_user'] }}
{% endif %}
    - shell: {{ pillar['default_shell'] }}
    - cwd: {{ pillar['default_home'] }}/stow
    - require:
      - file: dotfiles
      - file: {{ pillar['default_home']}}/.config
      - sls: packages
