{% set tf = salt['grains.filter_by']({
  'Darwin': {'source': 'https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_darwin_amd64.zip'},
  'Linux': {'source': 'https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_linux_amd64.zip'},
  },
  grain='kernel',
  merge={
    'version': '0.9.2',
    'hashes': 'https://releases.hashicorp.com/terraform/0.9.2/terraform_0.9.2_SHA256SUMS'
  })
%}

{% if grains['os'] == 'MacOS' %}
/opt/terraform:
  file.directory: []
/opt/terraform/{{ tf.version }}:
  file.directory: []

terraform_osx:
  file.directory:
    - name: "/opt/terraform/{{ tf.version }}/bin"
  cmd.run:
    - name: "curl -Lo terraform_download.zip {{ tf.source }} && unzip terraform_download.zip && rm terraform_download.zip"
    - cwd: "/opt/terraform/{{ tf.version }}/bin"
    - creates: "/opt/terraform/{{ tf.version }}/bin/terraform"
    - require:
      - file: terraform_osx

terraform:
  cmd.run:
    - name: "stow -t /usr/local -S {{ tf.version }}"
    - cwd: /opt/terraform
    - require:
      - cmd: terraform_osx

{% else %}

terraform:
  archive.extracted:
    - name: "/opt/terraform/{{ tf.version }}/bin"
    - source: {{ tf.source }}
    - source_hash: {{ tf.hashes }}
    - enforce_toplevel: false
  cmd.run:
    - name: "stow -t /usr/local -S {{ tf.version }}"
    - cwd: /opt/terraform
    - require:
      - archive: terraform
{% endif %}
