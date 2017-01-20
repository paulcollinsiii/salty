# Default packages I want installed that aren't listed elsewhere

apt_package_list:
  pkg.latest:
    - pkgs:
      - git
      - htop
      - tmux
      - zsh

ohmyzsh:
  git.latest:
    - name: https://github.com/robbyrussell/oh-my-zsh
    - target: {{ pillar['default_home'] }}/.oh-my-zsh
    - user: {{ pillar['default_user'] }}
    - unless: test -d {{ pillar['default_home'] }}/.oh-my-zsh
    - require:
      - pkg: apt_package_list
    - require_in:
      - sls: dotfiles

git_username:
  git.config_set:
    - user: {{ pillar['default_user'] }}
    - name: user.name
    - value: Paul Collins
    - global: True

git_useremail:
  git.config_set:
    - user: {{ pillar['default_user'] }}
    - name: user.email
    - value: "paul.collins.iii@gmail.com"
    - global: True

git_push:
  git.config_set:
    - user: {{ pillar['default_user'] }}
    - name: push.default
    - value: simple
    - global: True

git_ignore:
  git.config_set:
    - user: {{ pillar['default_user'] }}
    - name: core.excludesfile
    - value: "~/.gitignore_global"
    - global: True

git_pager:
  git.config_set:
    - user: {{ pillar['default_user'] }}
    - name: core.pager
    - value: "less -F -X"
    - global: True

git_editor:
  git.config_set:
    - user: {{ pillar['default_user'] }}
    - name: core.editor
    - value: "vim"
    - global: True

tmux_start:
    file.managed:
      - name: /usr/local/bin/tmuxstart
      - source: https://github.com/treyhunner/tmuxstart/raw/master/tmuxstart
      - source_hash: md5=789889cf45f927a730c6a35ddf8b3951
      - user: root
      - group: root
      - mode: 755

