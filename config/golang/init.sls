golang:
  cmd:
    - names:
      - apk add --repository=https://dl-cdn.alpinelinux.org/alpine/edge/community/ go
    - creates:
      - /usr/bin/go
    - run

mockgen:
  cmd:
    - names:
      - go install github.com/golang/mock/mockgen@latest
      - mv ~/go/bin/mockgen /usr/bin/mockgen
    - creates:
      - /usr/bin/mockgen
    - run
    - require:
        - cmd: golang

gopls:
  cmd:
    - names:
      - go install golang.org/x/tools/gopls@latest
      - mv ~/go/bin/gopls /usr/bin/gopls
    - creates:
      - /usr/bin/gopls
    - run
    - require:
      - cmd: golang

gofumpt:
  cmd:
    - names:
      - go install mvdan.cc/gofumpt@latest
      - mv ~/go/gofumpt /usr/bin/gofumpt
    - creates:
      - /usr/bin/gofumpt
    - run
    - require:
      - cmd: golang
