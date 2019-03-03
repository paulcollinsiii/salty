{% if grains['os'] == 'Debian' %}
default_user: vagrant
default_user_fullname: vagrant
default_group: vagrant
default_extragroup:
  - cdrom
  - floopy
  - sudo
  - audio
  - dip
  - video
  - plugdev
  - netdev
default_home: /home/vagrant
default_shell: /bin/zsh
default_root_group: root


pyenvs:
  base_path: /home/vagrant/.pyenv
  default_version:
    base_ver: 2.7
    py: python-2.7.13
    path: /home/vagrant/.pyenv/versions/2.7.13
  extra_versions:
    - py: python-3.6.4
      base_ver: 3.6
      path: /home/vagrant/.pyenv/versions/3.6.4

{% elif grains['os'] == 'Ubuntu' %}
default_user: ubuntu
default_user_fullname: ubuntu
default_group: ubuntu
default_home: /home/ubuntu
default_shell: /bin/zsh

pyenvs:
  base_path: /home/ubuntu/.pyenv
  default_version:
    py: python-2.7.12
    path: /home/ubuntu/.pyenv/versions/2.7.12

{% elif grains['os'] == 'FreeBSD' %}

default_user: vagrant
default_user_fullname: vagrant
default_group: vagrant
default_home: /home/vagrant
default_shell: /usr/local/bin/zsh

pyenvs:
  base_path: /home/vagrant/.pyenv
  default_version:
    py: 2.7.12
    path: /home/vagrant/.pyenv/versions/2.7.12

{% endif %}
