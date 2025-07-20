# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
#       Set up split-gpg backend 	
# ============================================

{{ slsdotpath }}_policy_file:
  file.managed:
    - name: "/etc/qubes/policy.d/30-user-gpg2.policy"
    - source: "salt://{{ tpldir }}/gpg2.policy"
    - user: root
    - group: root
    - mode: '0664'

{{ slsdotpath }}_install_package:
  pkg.installed:
    - pkgs:
      - split-gpg2-dom0

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
