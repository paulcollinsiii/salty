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

illum:
  git.latest:
    - name: https://github.com/jmesmon/illum.git
    - target: /opt/AUR/illum
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/illum
  pkg.installed:
    - name: ninja

acpi:
  git.latest:
    - name: https://github.com/m4ng0squ4sh/razer_blade_14_2016_acpi_fix
    - target: /opt/AUR/razer_blade_14_2016_acpi_fix
    - user: {{ pillar['default_user'] }}
    - unless:
      - ls /opt/AUR/razer_blade_14_2016_acpi_fix
  pkg.installed:
    - pkgs:
      - cpio
      - iasl
