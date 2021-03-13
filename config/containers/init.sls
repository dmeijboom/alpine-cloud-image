docker:
  pkg.installed

docker-compose:
  pkg:
    - installed
    - require:
      - pkg: docker

kubectl:
  cmd:
    - names:
      - |
        curl -LO https://dl.k8s.io/release/v1.20.4/bin/linux/amd64/kubectl && \
            chmod +x kubectl && \
            mv kubectl /bin/kubectl
    - run
