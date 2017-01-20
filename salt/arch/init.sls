# Handle some of the more annoying setup tasks in Arch

ifplugd:
  pkg.latest: []
  service.running:
    - name: netctl-ifplugd@enp58s0u1u1.service
    - enable: True
    - require:
      - pkg: ifplugd

ufw:
  pkg.latest: []
  service.running:
    - enable: True
    - require:
      - pkg: ufw

wpa_actiond:
  pkg.latest: []
  service.running:
    - name: netctl-auto@wlp59s0.service
    - enable: True

/etc/netctl/ethernet:
  file.managed:
    - source: salt://{{ tpldir }}/arch/files/ethernet
    - group: root
    - owner: root
    - mode: 0640
    - require_in:
      - pkg: ifplugd

/etc/sudoers:
  file.managed:
    - source: salt://{{ tpldir }}/arch/files/sudoers
    - group: root
    - owner: root
    - mode: 0440
    - check_cmd: /usr/bin/visudo -c -f
