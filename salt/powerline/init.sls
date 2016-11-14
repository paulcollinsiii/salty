# TODO: This needs to install in python3 instead because ubuntu vim-nox is py3 enabled, not py2
include:
  - pyenvs

{% if grains['os'] == 'Ubuntu' %}
powerline-system:
  cmd.run:
    - name: /usr/bin/pip3 install powerline-status
    - creates: /usr/local/bin/powerline
{% endif %}

powerline_fonts:
  cmd.run:
    - name: git clone https://github.com/powerline/fonts powerline-fonts
    - runas: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}
    - shell: {{ pillar['default_shell'] }}
    - creates: {{ pillar['default_home'] }}/powerline-fonts

fonts_install:
  cmd.run:
{% if grains['os'] == 'FreeBSD' %}
    - name: /usr/local/bin/zsh ./install.sh
{% else %}
    - name: ./install.sh
{% endif %}
    - runas: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}/powerline-fonts
    - shell: {{ pillar['default_shell'] }}
    - creates: {{ pillar['default_home'] }}/.local/share/fonts
    - require:
      - cmd: powerline_fonts
