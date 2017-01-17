arch_package_groups:
  pkg.group_installed:
    - pkgs:
      - base-devel
      - xfce4

arch_package_list:
  pkg.latest:
    - pkgs:
      - firefox
      - intel-ucode
      - mesa
      - nvidia
      - openssh
      - python
      - python-pip
      - python-setuptools
      - xf86-video-intel
      - xorg-server

bumblebee:
  pkg.installed: []
  service.enabled:
    - name: bumblebeed
    - requires:
      - pkg: bumblebee
