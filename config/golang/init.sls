install-golang:
  cmd:
    - names:
      - apk add --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community/ go
    - run

install-mockgen:
  cmd:
    - names:
      - go install github.com/golang/mock/mockgen@latest
    - run
    - require:
        - cmd: install-golang
