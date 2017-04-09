base:
  '*':
    - account
    - packages
    - dotfiles
    - hub
    - pyenvs
    - powerline
    - terraform
  'G@os:Arch':
    - packages.arch
    - neovim
  'G@os:FreeBSD':
    - packages.freebsd
    - vim
  'G@os:Ubuntu':
    - packages.ubuntu
    - node
    - vim
