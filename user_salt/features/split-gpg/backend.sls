# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# =====================================
#   Configure split-gpg backend VM      
# =====================================

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
    - source: "salt://{{ tpldir }}/backend.conf"
    - user: user
    - group: user
    - mode: '0664'
    - makedirs: True

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:

