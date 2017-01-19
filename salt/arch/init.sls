# Handle some of the more annoying setup tasks in Arch

# Make the ******* external docking station network dhcp itself
/etc/systemd/network/wired.network:
  file.managed:
    - source: salt://{{ tpldir }}/arch/files/wired.network
    - user: root
    - group: root
    - mode: 644

