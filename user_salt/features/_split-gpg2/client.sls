# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# =====================================
#   Configure split-gpg client VMs
# =====================================

{{ slsdotpath }}_split_gpg_config:
  file.managed:
    - name: "/home/user/.gnupg/gpg.conf"
    - source: "salt://{{ tpldir }}/gpg.conf"
    - user: user
    - group: user
    - mode: '0600'
    - makedirs: True

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:

