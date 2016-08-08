include:
  - packages

/home/paulcollins/.vimrc:
  file.managed:
    - source: salt://{{tpldir}}/files/vimrc
    - require:
      - sls: packages

/home/paulcollins/.vim/bundle/:
  file.directory:
    - makedirs: True

vundle:
  git.latest:
    - name: https://github.com/VundleVim/Vundle.vim
    - target: /home/paulcollins/.vim/bundle/Vundle.vim
    - require:
       - file: /home/paulcollins/.vim/bundle/
    - user: paulcollins

vundle_install:
  cmd.run:
    # Creates a bunch more, but this is one of the easy ones it does initially
    - creates: /home/paulcollins/.vim/bundle/nerdtree
    - name: vim +PluginInstall +qall
    - runas: 
