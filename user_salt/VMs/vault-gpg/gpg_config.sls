# sls: Setup split-gpg server end [vault-gpg]
# ===========================================

{{ slsdotpath }}_mkdir_gnupghome:
  file.directory:
    - name: "/home/user/split-gpg/"
    - user: user
    - group: user
    - mode: '0744'
    - makedirs: True

{{ slsdotpath }}_split_gpg_config:
  file.managed:
    - name: "/home/user/.config/qubes-split-gpg2/qubes-split-gpg2.conf"
    - source: "salt://{{ tpldir }}/split-gpg2.conf"
    - user: user
    - group: user
    - mode: '0664'
    - makedirs: True

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
