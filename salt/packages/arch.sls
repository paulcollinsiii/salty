include:
  - powerline
  - arch.aur

base-devel:
  pkg.group_installed:
    - requires:
      - pkg: arch_package_list

i3:
  pkg.group_installed: []

arch_cycle_fix:
  pkg.installed:
    - pkgs:
      - harfbuzz
      - noto-fonts
      - libx264

arch_package_list:
  pkg.installed:
    - pkgs:
      - alsa-utils
      - bbswitch
      - bumblebee
      - bluez
      - bluez-utils
      - compton
      - dialog
      - dmenu
      - firefox
      - gimp
      - go-tools
      - ifplugd
      - inkscape
      - intel-ucode
      - linux-headers
      - mesa
      - mlocate
      - net-tools
      - netctl
      - npm
      - nvidia
      - openssh
      - pamixer
      - pandoc
      - pavucontrol
      - pulseaudio
      - python
      - python-pip
      - python-setuptools
      - pwgen
      - rxvt-unicode
      - terminus-font
      - the_silver_searcher
      - unzip
      - vagrant
      - virtualbox
      - wpa_actiond
      - wpa_supplicant
      - xf86-video-intel
      - xorg-server
      - xorg-xinit
      - xorg-xrandr
    - require:
      - pkg: arch_cycle_fix
    - require_in:
      - cmd: powerline-system
