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
    - arch
    - packages.arch
    - neovim
  'G@os:FreeBSD':
    - packages.freebsd
    - vim
  'G@os:MacOS':
    - neovim
  'G@os:Ubuntu':
    - packages.ubuntu
    - node
    - vim
