# Handle some of the more annoying setup tasks in Arch
include:
  - packages.arch

ufw:
  pkg.installed: []
  service.running:
    - enable: True
    - require:
      - pkg: ufw

wpa_actiond:
  pkg.installed: []
  service.running:
    - name: netctl-auto@wlp59s0.service
    - enable: True

/etc/modprobe.d/bbswitch.conf:
  file.managed:
    - source: salt://{{ tpldir }}/files/bbswitch.conf
    - group: {{ pillar['default_root_group'] }}
    - user: root
    - mode: 0644
    - require:
      - sls: packages.arch

/etc/netctl/interfaces/en-any:
  file.managed:
    - source: salt://{{ tpldir }}/files/en-any
    - group: {{ pillar['default_root_group'] }}
    - user: root
    - mode: 0750
    - require:
      - sls: packages.arch

/etc/netctl/ethernet:
  file.managed:
    - source: salt://{{ tpldir }}/files/ethernet
    - group: {{ pillar['default_root_group'] }}
    - user: root
    - mode: 0640
    - require:
      - file: /etc/netctl/interfaces/en-any
      - sls: packages.arch

netctl-ifplugd@ethernet:
  service.enabled:
    - require:
      - sls: packages.arch

/etc/vconsole.conf:
  file.managed:
    - source: salt://{{ tpldir }}/files/vconsole.conf
    - group: {{ pillar['default_root_group'] }}
    - user: root
    - mode: 0640

/etc/sudoers:
  file.managed:
    - source: salt://{{ tpldir }}/files/sudoers
    - group: {{ pillar['default_root_group'] }}
    - user: root
    - mode: 0440
    - check_cmd: /usr/bin/visudo -c -f
