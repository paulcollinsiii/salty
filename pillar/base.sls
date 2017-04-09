{% if grains['os'] in ['Arch', 'Ubuntu'] %}
default_user: paulcollins
default_user_fullname: Paul Collins
default_group: paulcollins
default_home: /home/paulcollins
default_shell: /bin/zsh

pyenvs:
  base_path: /home/paulcollins/.pyenv
  default_version:
    base_ver: 2.7
    py: python-2.7.12
    path: /home/paulcollins/.pyenv/versions/2.7.12
  extra_versions:
    - py: python-3.5.2
      base_ver: 3.5
      path: /home/paulcollins/.pyenv/versions/3.5.2

{% elif grains['os'] == 'FreeBSD' %}

default_user: paulcollins
default_user_fullname: paulcollins
default_group: paulcollins
default_home: /usr/home/paulcollins
default_shell: /usr/local/bin/zsh

pyenvs:
  base_path: /usr/home/paulcollins/.pyenv
  default_version:
    base_ver: 2.7
    py: 2.7.12
    path: /usr/home/paulcollins/.pyenv/versions/2.7.12

{% endif %}
