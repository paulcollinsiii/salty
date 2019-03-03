include:
  - packages

pyenv-deps:
  pkg.installed:
    - pkgs:
{% if grains['os'] in ('Debian', 'Ubuntu') %}
      - build-essential
      - libssl-dev
      - zlib1g-dev
      - libbz2-dev
      - libreadline-dev
      - libsqlite3-dev
      - llvm
      - zlib1g
{% elif grains['os'] == 'FreeBSD' %}
      - bash
      - gmake
      - sqlite3
      - zlib
{% elif grains['os'] == 'MacOS' %}
      - readline
      - xz
      - zlib
{% endif %}
      - wget
      - curl

{{ pillar['pyenvs']['default_version']['py'] }}:
  pyenv.installed:
    - user: {{ pillar['default_user'] }}
    - default: true
    - require:
      - pkg: pyenv-deps
      - sls: packages
{% if grains['os'] == 'Arch' %}
      - sls: packages.arch
{% endif %}

{% for version in pillar['pyenvs']['extra_versions'] %}
{{ version['py'] }}:
  pyenv.installed:
    - user: {{ pillar['default_user'] }}
    - require:
      - pkg: pyenv-deps
      - sls: packages
{% endfor %}

pyenv_virtualenv:
  cmd.run:
    - name: git clone https://github.com/yyuu/pyenv-virtualenv.git
    - runas: {{ pillar['default_user'] }}
    - shell: {{ pillar['default_shell'] }}
    - cwd: {{ pillar['pyenvs']['base_path'] }}/plugins
    - creates: {{ pillar['pyenvs']['base_path'] }}/plugins/pyenv-virtualenv
    - require:
      - pyenv: {{ pillar['pyenvs']['default_version']['py'] }}
      - sls: packages
