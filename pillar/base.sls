{% if grains['virtual'] == "physical" %}
default_user: paulcollins
default_user_fullname: Paul Collins
default_group: paulcollins
default_home: /home/paulcollins
{% elif grains['virtual'] == "oracle" %}
default_user: ubuntu
default_user_fullname: ubuntu
default_group: ubuntu
default_home: /home/ubuntu
{% endif %}

pyenvs:
  base_path: /home/paulcollins/.pyenv
  default_version:
    py: python-2.7.12
    path: /home/paulcollins/.pyenv/versions/2.7.12

