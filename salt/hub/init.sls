include:
  - dotfiles

hub_binary:
  archive.extracted:
    - name: /opt/hub
    {% if grains['os'] == 'MacOS' %}
    - source: https://github.com/github/hub/releases/download/v2.2.9/hub-darwin-amd64-2.2.9.tgz
    - source_hash: md5=e0c801a16ce632b954ba1534bcc46ce7
    {% else %}
    - source: https://github.com/github/hub/releases/download/v2.2.8/hub-linux-amd64-2.2.8.tgz
    - source_hash: md5=a62fa633d6777e44029ab387e4ad25f6
    {% endif %}
    - options: z
    - archive_format: tar

hub_stow:
  cmd.run:
    {% if grains['os'] == 'MacOS' %}
    - name: "stow --ignore='(install|LICENSE|README.md)' -t /usr/local -S hub-darwin-amd64-2.2.9"
    {% else %}
    - name: "stow --ignore='(install|LICENSE|README.md)' -t /usr/local -S hub-linux-amd64-2.2.8"
    {% endif %}
    - cwd: /opt/hub
    - creates: /usr/local/bin/hub
    - require:
      - sls: dotfiles
