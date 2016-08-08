include: packages

/home/paulcollins/.vimrc:
  file.managed:
    - source: salt://{{tpldr}}/files/vimrc
    - require:
      - sls: packages

/home/paulcollins/.vim/bundle/:
  file.directory:
    - makedirs: True

vundle:
  git.present:
    - name: /home/paulcollins/.vim/bundle/Vundle.vim
    - require:
       - file: /home/paulcollins/.vim/bundle/
