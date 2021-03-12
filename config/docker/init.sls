docker:
  pkg.installed

docker-compose:
  pkg:
    - installed
    - require:
      - pkg: docker
