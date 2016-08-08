include:
  - packages

vim:
  pkg.installed: []

{{ pillar['default_home'] }}/.vimrc:
  file.managed:
    - source: salt://{{tpldir}}/files/vimrc
    - require:
      - sls: packages

vundle:
  file.directory:
    - name: {{ pillar['default_home'] }}/.vim/bundle/
    - makedirs: True
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim
    - target: {{ pillar['default_home'] }}/.vim/bundle/Vundle.vim
    - require:
       - file: vundle
    - user: paulcollins
  cmd.run:
    # Creates a bunch more, but this is one of the easy ones it does initially
    - creates: {{ pillar['default_home'] }}/.vim/bundle/nerdtree
    - name: vim +PluginInstall +qall
    - runas: {{ pillar['default_user'] }}
    - require:
      - git: vundle
      - pkg: vim
