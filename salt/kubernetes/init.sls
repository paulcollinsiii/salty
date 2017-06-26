{% set kb = salt['grains.filter_by']({
  'Darwin': {
    'kube': '/bin/darwin/amd64/kubectl',
    'minikube': 'https://storage.googleapis.com/minikube/releases/v0.19.0/minikube-darwin-amd64',
    },
  'Linux': {
    'kube': 'bin/linux/amd64/kubectl',
    'minikube': 'https://storage.googleapis.com/minikube/releases/v0.19.0/minikube-linux-amd64',
    },
  },
  grain='kernel',
  merge={
    'base_url': 'https://storage.googleapis.com/kubernetes-release/release',
    'kube_version': 'v1.6.4',
    'minikube_version': '0.19.0',
  })
%}


/opt/kubernetes:
  file.directory: []

/opt/kubernetes/{{ kb.kube_version }}:
  file.directory: []

/opt/minikube:
  file.directory: []

/opt/minikube/{{ kb.minikube_version }}:
  file.directory: []

kubernetes:
  file.directory:
    - name: "/opt/kubernetes/{{ kb.kube_version }}/bin"
  cmd.run:
    - name: "curl -LO {{ kb.base_url }}/{{ kb.kube_version }}/{{ kb.kube }} && chmod +x kubectl"
    - cwd: "/opt/kubernetes/{{ kb.kube_version }}/bin"
    - creates: "/opt/kubernetes/{{ kb.kube_version }}/bin/kubectl"
    - require:
      - file: kubernetes

kubernetes_stow:
  cmd.run:
    - name: "stow -t /usr/local -S {{ kb.kube_version }}"
    - cwd: /opt/kubernetes
    - require:
      - cmd: kubernetes

minikube:
  file.directory:
    - name: "/opt/minikube/{{ kb.minikube_version }}/bin"
  cmd.run:
    - name: "curl -LO {{ kb.minikube }} && chmod +x minikube-linux-amd64"
    - cwd: "/opt/minikube/{{ kb.minikube_version }}/bin"
    - creates: "/opt/minikube/{{ kb.minikube_version }}/bin/minikube-linux-amd64"
    - require:
      - file: minikube

minikube_stow:
  cmd.run:
    - name: "stow -t /usr/local -S {{ kb.minikube_version }}"
    - cwd: /opt/minikube
    - require:
      - cmd: minikube
