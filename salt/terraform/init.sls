{% set tf = salt['grains.filter_by']({
  'Darwin': {'source': 'https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_darwin_amd64.zip'},
  'Linux': {'source': 'https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_linux_amd64.zip'},
  },
  grain='kernel',
  merge={
    'version': '0.8.4',
    'hashes': 'https://releases.hashicorp.com/terraform/0.8.4/terraform_0.8.4_SHA256SUMS'
  })
%}

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

