base:
  '*':
    - account
    - packages
    - dotfiles
    - hub
    - pyenvs
    - powerline
    - vim
  'G@os:FreeBSD':
    - packages.freebsd
  'G@os:Ubuntu':
    - packages.ubuntu
    - node
