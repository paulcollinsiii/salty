pyenv-deps:
  pkg.installed:
    - pkgs:
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - wget
      - curl
      - llvm

{{ pillar['pyenvs']['default_version']['py'] }}:
  pyenv.installed:
    - user: {{ pillar['default_user'] }}
    - default: true
    - require:
      - pkg: pyenv-deps

pyenv_virtualenv:
  cmd.run:
    - name: git clone https://github.com/yyuu/pyenv-virtualenv.git
    - user: {{ pillar['default_user'] }}
    - cwd: {{ pillar['pyenvs']['base_path'] }}/plugins
    - creates: {{ pillar['pyenvs']['base_path'] }}/plugins/pyenv-virtualenv
    - require:
      - pyenv: {{ pillar['pyenvs']['default_version']['py'] }}
