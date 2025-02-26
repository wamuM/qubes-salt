# sls: Set up ssh [ssh-charles]
# ===========================
/home/user/.ssh/config:
  file.managed:
    - source: salt://{{ tpldir }}/ssh_config
    - makedirs: True


# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
