{% set kb = salt['grains.filter_by']({
  'Darwin': {
    'kubectl': 'https://storage.googleapis.com/kubernetes-release/release/bin/darwin/amd64/kubectl',
    'minikube': 'https://storage.googleapis.com/minikube/releases/v1.11.1/minikube-darwin-amd64',
    'skaffold': '',
    },
  'Linux': {
    'kubectl': 'https://storage.googleapis.com/kubernetes-release/release/v1.6.4/bin/linux/amd64/kubectl',
    'minikube': 'https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64',
    'skaffold': 'https://storage.googleapis.com/skaffold/releases/latest/skaffold-linux-amd64',
    },
  },
  grain='kernel',
  merge={
    'kubectl_version': 'v1.6.4',
    'minikube_version': 'v1.11.1',
    'skaffold_version': 'v0.10.0',
  })
%}


/opt/kubernetes:
  file.directory: []

/opt/kubernetes/{{ kb.kubectl_version }}:
  file.directory: []

/opt/minikube:
  file.directory: []

/opt/minikube/{{ kb.minikube_version }}:
  file.directory: []

/opt/skaffold:
  file.directory: []

/opt/skaffold/{{ kb.skaffold_version }}:
  file.directory: []

kubernetes:
  file.directory:
    - name: "/opt/kubernetes/{{ kb.kubectl_version }}/bin"
  cmd.run:
    - name: "curl -Lo kubectl {{ kb.kubectl }} && chmod +x kubectl"
    - cwd: "/opt/kubernetes/{{ kb.kubectl_version }}/bin"
    - creates: "/opt/kubernetes/{{ kb.kubectl_version }}/bin/kubectl"
    - require:
      - file: kubernetes

kubernetes_stow:
  cmd.run:
    - name: "stow -t /usr/local -R {{ kb.kubectl_version }}"
    - cwd: /opt/kubernetes
    - require:
      - cmd: kubernetes

minikube:
  file.directory:
    - name: "/opt/minikube/{{ kb.minikube_version }}/bin"
  cmd.run:
    - name: "curl -Lo minikube {{ kb.minikube }} && chmod +x minikube"
    - cwd: "/opt/minikube/{{ kb.minikube_version }}/bin"
    - creates: "/opt/minikube/{{ kb.minikube_version }}/bin/minikube"
    - require:
      - file: minikube

minikube_stow:
  cmd.run:
    - name: "stow -t /usr/local -S {{ kb.minikube_version }}"
    - cwd: /opt/minikube
    - require:
      - cmd: minikube

skaffold:
  file.directory:
    - name: "/opt/skaffold/{{ kb.skaffold_version }}/bin"
  cmd.run:
    - name: "curl -Lo skaffold {{ kb.skaffold }} && chmod +x skaffold"
    - cwd: "/opt/skaffold/{{ kb.skaffold_version }}/bin"
    - creates: "/opt/skaffold/{{ kb.skaffold_version }}/bin/skaffold"
    - require:
      - file: skaffold

skaffold_stow:
  cmd.run:
    - name: "stow -t /usr/local -S {{ kb.skaffold_version }}"
    - cwd: /opt/skaffold
    - require:
      - cmd: skaffold
