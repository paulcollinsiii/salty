base:
  '*':
    - account
    - packages
    - dotfiles
    - hub
    - pyenvs
    - powerline
    - terraform
    - vim
  'G@os:Arch':
    - packages.arch
  'G@os:FreeBSD':
    - packages.freebsd
  'G@os:Ubuntu':
    - packages.ubuntu
    - node
