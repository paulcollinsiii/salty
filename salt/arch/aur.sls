# AUR repos that are kinda nice to have

/opt/AUR:
  file.directory:
    - user: root
    - group: users
    - dir_mode: 0770

grail:
  git.latest:
    - name: https://aur.archlinux.org/grail.git
    - target: /opt/AUR/grail
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/grail

frame:
  git.latest:
    - name: https://aur.archlinux.org/frame.git
    - target: /opt/AUR/frame
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/frame

geis:
  git.latest:
    - name: https://aur.archlinux.org/geis.git
    - target: /opt/AUR/geis
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/geis

touchegg:
  git.latest:
    - name: https://aur.archlinux.org/touchegg.git
    - target: /opt/AUR/touchegg
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/touchegg
