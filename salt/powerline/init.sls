include:
  - pyenvs

powerline:
  cmd.run:
    - name: {{ pillar['pyenvs']['default_version']['path'] }}/bin/pip install powerline-status
    - creates: {{ pillar['pyenvs']['default_version']['path'] }}/bin/powerline
    - require:
      - sls: pyenvs

powerline_fonts:
  cmd.run:
    - name: git clone https://github.com/powerline/fonts powerline-fonts
    - user: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}
    - creates: {{ pillar['default_home'] }}/powerline-fonts

fonts_install:
  cmd.run:
    - name: ./install.sh
    - user: {{ pillar['default_user'] }}
    - cwd: {{ pillar['default_home'] }}/powerline-fonts
    - creates: {{ pillar['default_home'] }}/.local/share/fonts
    - require:
      - cmd: powerline_fonts
