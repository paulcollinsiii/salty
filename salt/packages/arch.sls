include:
  - powerline
  - arch.aur

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
  pkg.installed:
    - pkgs:
      - harfbuzz
      - noto-fonts
      - mesa-libgl
      - libx264

arch_package_list:
  pkg.installed:
    - pkgs:
      - alsa-utils
      - bluez-utils
      - dialog
      - firefox
      - intel-ucode
      - mesa
      - mlocate
      - net-tools
      - npm
      - nvidia
      - openssh
      - pamixer
      - pavucontrol
      - pulseaudio
      - python
      - python-pip
      - python-setuptools
      - unzip
      - wpa_actiond
      - wpa_supplicant
      - xf86-input-synaptics
      - xf86-video-intel
      - xorg-server
    - require:
      - pkg: arch_cycle_fix
    - require_in:
      - cmd: powerline-system

bumblebee:
  pkg.installed: []
  service.enabled:
    - name: bumblebeed
    - requires:
      - pkg: bumblebee

