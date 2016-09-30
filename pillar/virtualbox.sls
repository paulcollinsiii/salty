{% if grains['os'] == 'Ubuntu' %}
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
