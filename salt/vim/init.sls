include:
  - packages

vim:
  pkg.installed:
{% if grains['os'] == 'FreeBSD' %}
    - pkgs:
      - vim
      - ruby
{% elif grains['os'] == 'Ubuntu' %}
    - pkgs:
      - vim-nox
      - ruby-dev
{% endif %}

vundle:
  file.directory:
    - name: {{ pillar['default_home'] }}/.vim/bundle/
    - makedirs: True
    - user: {{ pillar['default_user'] }}
    - group: {{ pillar['default_group'] }}
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim
    - target: {{ pillar['default_home'] }}/.vim/bundle/Vundle.vim
    - branch: master
    - submodules: True
    - require:
       - file: vundle
    - user: {{ pillar['default_user'] }}
    - unless: test -d {{ pillar['default_home'] }}/.vim/bundle/Vundle.vim
