{% if grains['os'] == 'Ubuntu' %}
# Some helpful PPA's
darktable_ppa:
  pkgrepo.managed:
    - ppa: pmjdebruijn/darktable-release

postgres_ppa:
  pkgrepo.managed:
    - humanname: Postgres Repo
    - name: deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
    - gpgcheck: 1
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc

{% endif %}

# Default packages I want installed that aren't listed elsewhere

apt_package_list:
  pkg.latest:
    - pkgs:
      - git
      - htop
      - tmux
      - zsh
      {% if grains['virtual'] == 'physical' and grains['os'] == 'Ubuntu' %}
      - darktable
      - vagrant
      - virtualbox
      {% endif %}


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
