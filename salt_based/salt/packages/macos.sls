# Default packages I want installed that aren't listed elsewhere

mac_package_list:
  pkg.installed:
    - pkgs:
      - findutils
      - postgresql@9.5
      - psutils
      - python  # We want the brew version of python
      - reattach-to-user-namespace
      - the_silver_searcher
      - nodenv
      - parallel
