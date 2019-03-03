include:
  - dotfiles

hub_binary:
  archive.extracted:
    - name: /opt/hub
    {% if grains['os'] == 'MacOS' %}
    - source: https://github.com/github/hub/releases/download/v2.3.0-pre10/hub-darwin-amd64-2.3.0-pre10.tgz
    - source_hash: md5=beb3c64165a91f94fb608765a4d7b450
    {% else %}
    - source: https://github.com/github/hub/releases/download/v2.2.8/hub-linux-amd64-2.2.8.tgz
    - source_hash: md5=a62fa633d6777e44029ab387e4ad25f6
    {% endif %}
    - options: z
    - archive_format: tar

hub_stow:
  cmd.run:
    {% if grains['os'] == 'MacOS' %}
    - name: "stow --ignore='(install|LICENSE|README.md)' -t /usr/local -S hub-darwin-amd64-2.3.0-pre10"
    {% else %}
    - name: "stow --ignore='(install|LICENSE|README.md)' -t /usr/local -S hub-linux-amd64-2.2.8"
    {% endif %}
    - cwd: /opt/hub
    - creates: /usr/local/bin/hub
    - require:
      - sls: dotfiles
