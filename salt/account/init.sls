# This should mostly be modifying the current user assuming the machine was
# setup initially with the default_user

{{ pillar['default_user'] }}:
  user.present:
    - fullname: {{ pillar['default_user_fullname'] }}
    - shell: /bin/zsh
    - home: {{ pillar['default_home'] }}
    - gid: {{ pillar['default_group'] }}
    - groups:
      - adm
      - cdrom
      - sudo
      - plugdev
      - users
      {% if grains['virtual'] == 'physical' %}
      - lpadmin
      - sambashare
      {% endif %}
