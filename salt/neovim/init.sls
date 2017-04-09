neovim:
  pkg.latest:
    - pkgs:
      - neovim
      - python-neovim
      - python2-neovim

{{ pillar['default_home']}}/.config/nvim/autoload:
  file.directory:
    - user: {{ pillar['default_user'] }}
    - group: {{ pillar['default_group'] }}

plug.vim:
  cmd.run:
    - name: "curl -LO https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
    - cwd: {{ pillar['default_home']}}/.config/nvim/autoload
    - user: {{ pillar['default_user'] }}
    - group: {{ pillar['default_group'] }}
    - creates: {{ pillar['default_home']}}/.config/nvim/autoload/plug.vim
    - require:
      - file: {{ pillar['default_home']}}/.config/nvim/autoload


{{ pillar['pyenvs']['default_version']['py'] }}-neovim:
  cmd.run:
    - name: "{{ pillar['pyenvs']['default_version']['path'] }}/bin/pip install neovim"
    - user: {{ pillar['default_user'] }}
    - creates: "{{ pillar['pyenvs']['default_version']['path'] }}/lib/python{{ pillar['pyenvs']['default_version']['base_ver'] }}/site-packages/neovim/__init__.py"
    - require:
      - sls: pyenvs
      - sls: packages

{% for version in pillar['pyenvs']['extra_versions'] %}
{{ version['py'] }}-neovim:
  cmd.run:
    - name: "{{ version['path'] }}/bin/pip install neovim"
    - user: {{ pillar['default_user'] }}
    - creates: "{{ version['path'] }}/lib/python{{ version['base_ver'] }}/site-packages/neovim/__init__.py"
    - require:
      - sls: pyenvs
      - sls: packages
{% endfor %}
