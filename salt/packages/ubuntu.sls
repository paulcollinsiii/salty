# Some helpful PPA's
darktable_ppa:
  pkgrepo.managed:
    - ppa: pmjdebruijn/darktable-release

postgres_ppa:
  pkgrepo.managed:
    - humanname: Postgres Repo
    - name: deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main
    - gpgcheck: 1
    - key_url: https://www.postgresql.org/media/keys/ACCC4CF8.asc

nvidia_ppa:
  pkgrepo.managed:
    - humanname: Nvidia Drivers
    - ppa: graphics-drivers/ppa

neovim_ppa:
  pkgrepo.managed:
    - humanname: NEO-Vim
    - ppa: neovim-ppa/unstable


ubuntu_apt_package_list:
  pkg.latest:
    - pkgs:
      - aptitude
      - editorconfig
      - neovim
      - python3-pip
      - silversearcher-ag
      - xclip
      {% if grains['virtual'] == 'physical' %}
      - nvidia-367
      - darktable
      - vagrant
      - virtualbox
      {% endif %}
    - require:
      - pkgrepo: neovim_ppa
