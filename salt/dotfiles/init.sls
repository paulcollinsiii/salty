dotfiles:
  file.recurse:
    - name: {{ pillar['default_home'] }}/stow
    - source: salt://{{ tpldir }}/stow
    - user: {{ pillar['default_user'] }}
    - group: {{ pillar['default_group'] }}
    - file_mode: 400
    - template: jinja

stow:
  pkg.installed:
    - name: stow
  cmd.run:
    - name: "stow -t {{ pillar['default_home'] }} -S vim -S tmux -S zsh -S oh-my-zsh"
    - user: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}/stow
    - require:
      - file: dotfiles
