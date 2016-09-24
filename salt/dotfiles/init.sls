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
  'oh-my-zsh',
  'tmux',
  'vim',
  'zsh',
] %}

stow:
  pkg.installed:
    - name: stow
  cmd.run:
    - name: "stow -t {{ pillar['default_home'] }} -S {{ modules | join(' -S ') }}"
    - user: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}/stow
    - require:
      - file: dotfiles
