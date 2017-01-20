# AUR repos that are kinda nice to have

/opt/AUR:
  file.directory:
    - user: root
    - group: users
    - dir_mode: 0770

xfce4-pulseaudio-plugin:
  git.latest:
    - name: https://aur.archlinux.org/xfce4-pulseaudio-plugin.git
    - target: /opt/AUR/xfce4-pulseaudio-plugin
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/xfce4-pulseaudio-plugin
