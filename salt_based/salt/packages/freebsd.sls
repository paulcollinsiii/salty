free_bsd:
  pkg.installed:
    - pkgs:
      - i3
      - i3lock
      - i3status
      - dmenu
      - xorg


xinit:
  file.managed:
    - name: {{ pillar['default_home'] }}/.xinitrc
    - contents: |
        /usr/local/bin/i3
