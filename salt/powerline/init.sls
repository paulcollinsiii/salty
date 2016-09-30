# TODO: This needs to install in python3 instead because ubuntu vim-nox is py3 enabled, not py2
include:
  - pyenvs

powerline:
  cmd.run:
    - name: {{ pillar['pyenvs']['default_version']['path'] }}/bin/pip install powerline-status
    - runas: {{ pillar['default_user'] }}
    - creates: {{ pillar['pyenvs']['default_version']['path'] }}/bin/powerline
    - shell: {{ pillar['default_shell'] }}
    - require:
      - sls: pyenvs

powerline_fonts:
  cmd.run:
    - name: git clone https://github.com/powerline/fonts powerline-fonts
    - runas: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}
    - shell: {{ pillar['default_shell'] }}
    - creates: {{ pillar['default_home'] }}/powerline-fonts

fonts_install:
  cmd.run:
    - name: ./install.sh
    - runas: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}/powerline-fonts
    - shell: {{ pillar['default_shell'] }}
    - creates: {{ pillar['default_home'] }}/.local/share/fonts
    - require:
      - cmd: powerline_fonts