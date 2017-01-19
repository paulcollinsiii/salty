include:
  - powerline

base-devel:
  pkg.group_installed:
    - requires:
      - pkg: arch_package_list

xfce4:
  pkg.group_installed:
    - requires:
      - pkg: arch_package_list
      - pkg: base-devel

arch_cycle_fix:
  pkg.latest:
    - pkgs:
      - harfbuzz
      - noto-fonts
      - mesa-libgl
      - libx264

arch_package_list:
  pkg.latest:
    - pkgs:
      - alsa-utils
      - dialog
      - firefox
      - intel-ucode
      - mesa
      - mlocate
      - nvidia
      - openssh
      - pulseaudio
      - python
      - python-pip
      - python-setuptools
      - wpa_actiond
      - wpa_supplicant
      - xf86-video-intel
      - xorg-server
    - requires:
      - pkg: arch_cycle_fix
    - require_in:
      - cmd: powerline-system

bumblebee:
  pkg.installed: []
  service.enabled:
    - name: bumblebeed
    - requires:
      - pkg: bumblebee

