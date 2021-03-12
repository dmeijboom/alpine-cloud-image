cloud-init:
  pkg.installed

setup-cloud-init:
  cmd:
    - names:
      - setup-cloud-init
    - run
    - require:
        - pkg: cloud-init

/etc/sudoers:
  file.managed:
    - source: salt://multipass/sudoers
    - user: root
    - group: root

# fix issue with unset password for default user (see: https://github.com/camptocamp/puppet-accounts/issues/35)
fix-ssh:
  cmd:
    - names:
      - echo "UsePAM yes" >> /etc/ssh/sshd_config
    - run

openssh-server-pam:
  pkg.installed
