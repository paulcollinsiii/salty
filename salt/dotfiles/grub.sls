# Noueavu drivers, you're the biggest cause of bugs it seems. Hardlock, thy name is noueavu
# or perhaps nvidia

grub_defaults:
  file.line:
    - name: /etc/default/grub
    - content: GRUB_CMDLINE_LINUX="nouveau.blacklist=1"
    - match: "^GRUB_CMDLINE_LINUX"
    - mode: ensure
    - show_changes: True

grub_rebuild:
  cmd.run:
    - name: /usr/sbin/update-grub
    - user: root
    - cwd: /
    - watch:
      - file: grub_defaults
