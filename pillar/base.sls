{% if grains['os'] in ['Arch', 'Ubuntu'] %}
default_user: paulcollins
default_user_fullname: Paul Collins
default_group: paulcollins
default_extragroup:
  - docker
  - bumblebee
default_home: /home/paulcollins
default_shell: /bin/zsh
default_root_group: root


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
default_extragroup:
  - wheel
default_home: /usr/home/paulcollins
default_shell: /usr/local/bin/zsh
default_root_group: root

pyenvs:
  base_path: /usr/home/paulcollins/.pyenv
  default_version:
    base_ver: 2.7
    py: 2.7.12
    path: /usr/home/paulcollins/.pyenv/versions/2.7.12

{% elif grains['os'] == 'MacOS' %}
default_user: paulcollins
default_user_fullname: Paul Collins
default_group: staff
default_extragroup:
  - wheel
default_home: /Users/paulcollins
default_shell: /bin/zsh
default_root_group: wheel

pyenvs:
  base_path: /Users/paulcollins/.pyenv
  default_version:
    base_ver: 2.7
    py: python-2.7.12
    path: /Users/paulcollins/.pyenv/versions/2.7.12
  extra_versions:
    - py: python-3.5.2
      base_ver: 3.5
      path: /Users/paulcollins/.pyenv/versions/3.5.2
{% endif %}
