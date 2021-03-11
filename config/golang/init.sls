go:
  pkg.installed

install-mockgen:
  cmd:
    - names:
      - go install github.com/golang/mock/mockgen
    - run
    - require:
        - pkg: go
