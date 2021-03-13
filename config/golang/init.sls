golang:
  cmd:
    - names:
      - apk add --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community/ go
    - run

mockgen:
  cmd:
    - names:
      - go install github.com/golang/mock/mockgen@latest
    - run
    - require:
        - cmd: golang

gopls:
  cmd:
    - names:
      - go install golang.org/x/tools/gopls@latest
    - run
    - require:
      - cmd: golang
