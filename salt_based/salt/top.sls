base:
  '*':
    - account
    - packages
    - dotfiles
    - hub
    - neovim
    - pyenvs
    - powerline
    - terraform
  'G@os:Arch':
    - arch
    - packages.arch
    - kubernetes
  'G@os:Debian':
    - packages.debian
  'G@os:FreeBSD':
    - packages.freebsd
  'G@os:MacOS':
    - packages.macos
  'G@os:Ubuntu':
    - packages.ubuntu
    - node
