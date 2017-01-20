include:
  - dotfiles

hub_binary:
  archive.extracted:
    - name: /opt/hub
    - source: https://github.com/github/hub/releases/download/v2.2.8/hub-linux-amd64-2.2.8.tgz
    - source_hash: md5=a62fa633d6777e44029ab387e4ad25f6
    - options: z
    - archive_format: tar

hub_stow:
  cmd.run:
    - name: "stow -t /usr/local -S hub-linux-amd64-2.2.8"
    - cwd: /opt/hub
    - creates: /usr/local/bin/hub
    - require:
      - sls: dotfiles
