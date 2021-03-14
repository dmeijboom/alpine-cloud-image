/etc/skel/.zshrc:
  file.managed:
    - source: salt://user-config/zshrc

/etc/skel/.config/starship.toml:
  file.managed:
    - source: salt://user-config/starship.toml

/etc/skel/.config/nvim/init.vim:
  file.managed:
    - source: salt://user-config/init.vim
