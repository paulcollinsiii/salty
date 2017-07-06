{% set tf = salt['grains.filter_by']({
  'Darwin': {'source': 'https://releases.hashicorp.com/terraform/0.9.11/terraform_0.9.11_darwin_amd64.zip'},
  'Linux': {'source': 'https://releases.hashicorp.com/terraform/0.9.11/terraform_0.9.11_linux_amd64.zip'},
  },
  grain='kernel',
  merge={
    'version': '0.9.11',
    'previous': '0.9.2',
    'hashes': 'https://releases.hashicorp.com/terraform/0.9.11/terraform_0.9.11_SHA256SUMS'
  })
%}

terraform_unstow:
  cmd.run:
    - name: "stow -t /usr/local -D {{ tf.previous }}"
    - cwd: /opt/terraform
    - onlyif: "test -e /opt/terraform/{{ tf.previous }}"

/opt/terraform/{{ tf.previous }}:
  file.absent:
    - watch:
      - terraform_unstow

{% if grains['os'] == 'MacOS' %}
/opt/terraform:
  file.directory: []
/opt/terraform/{{ tf.version }}:
  file.directory: []

terraform:
  file.directory:
    - name: "/opt/terraform/{{ tf.version }}/bin"
  cmd.run:
    - name: "curl -Lo terraform_download.zip {{ tf.source }} && unzip terraform_download.zip && rm terraform_download.zip"
    - cwd: "/opt/terraform/{{ tf.version }}/bin"
    - creates: "/opt/terraform/{{ tf.version }}/bin/terraform"
    - require:
      - file: terraform

terraform_stow:
  cmd.run:
    - name: "stow -t /usr/local -S {{ tf.version }}"
    - cwd: /opt/terraform
    - require:
      - cmd: terraform
      - cmd: terraform_unstow

{% else %}

terraform:
  archive.extracted:
    - name: "/opt/terraform/{{ tf.version }}/bin"
    - source: {{ tf.source }}
    - source_hash: {{ tf.hashes }}
    - enforce_toplevel: false

terraform_stow:
  cmd.run:
    - name: "stow -t /usr/local -S {{ tf.version }}"
    - cwd: /opt/terraform
    - require:
      - archive: terraform
      - cmd: terraform_unstow
{% endif %}
