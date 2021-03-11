go:
  pkg.installed:
    name: go
  script:
    cmd: go install github.com/golang/mock/mockgen
    require:
      pkg: go
