include:
  - powerline
  - arch.aur

base-devel:
  pkg.group_installed:
    - requires:
      - pkg: arch_package_list

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
      - autocutsel
      - bbswitch
      - bumblebee
      - bluez
      - bluez-utils
      - chromium
      - compton
      - dialog
      - dmenu
      - firefox
      - ifplugd
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
      - xclip
      - xf86-video-intel
      - xorg-server
      - xorg-xinit
      - xorg-xrandr
      - i3-gaps
      - i3blocks
      - i3lock
      - i3status
      - termite
    - require:
      - pkg: arch_cycle_fix
    - require_in:
      - cmd: powerline-system
