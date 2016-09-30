pyenv-deps:
  pkg.installed:
    - pkgs:
{% if grains['os'] == 'Ubuntu' %}
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - llvm
{% elif grains['os'] == 'FreeBSD' %}
      - bash
      - gmake
      - sqlite3
{% endif %}
      - wget
      - curl

{{ pillar['pyenvs']['default_version']['py'] }}:
  pyenv.installed:
    - user: {{ pillar['default_user'] }}
    - default: true
    - require:
      - pkg: pyenv-deps

pyenv_virtualenv:
  cmd.run:
    - name: git clone https://github.com/yyuu/pyenv-virtualenv.git
    - runas: {{ pillar['default_user'] }}
    - shell: {{ pillar['default_shell'] }}
    - cwd: {{ pillar['pyenvs']['base_path'] }}/plugins
    - creates: {{ pillar['pyenvs']['base_path'] }}/plugins/pyenv-virtualenv
    - require:
      - pyenv: {{ pillar['pyenvs']['default_version']['py'] }}
