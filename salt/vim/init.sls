include:
  - packages

vim:
  pkg.absent:
{% if grains['os'] == 'FreeBSD' %}
    - pkgs:
      - vim
{% elif grains['os'] == 'Ubuntu' %}
    - pkgs:
      - vim-nox
{% endif %}

vundle:
  file.absent:
    - name: {{ pillar['default_home'] }}/.vim
