node_repo:
  pkgrepo.managed:
    - humanname: Node
    - name: deb https://deb.nodesource.com/node_7.x yakkety main
    - gpgcheck: 1
    - gpgkey: https://deb.nodesource.com/gpgkey/nodesource.gpg.key
    - file: /etc/apt/sources.list.d/node.list
  pkg.latest:
    - name: nodejs
    - require:
      - pkgrepo: node_repo
