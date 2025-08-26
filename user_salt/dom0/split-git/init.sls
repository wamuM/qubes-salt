# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
# 	Setup split-git in dom0      [dom0]
# ============================================

{{ slsdotpath }}_policy_file:
  file.managed:
    - name: "/etc/qubes/policy.d/10-split-git.policy"
    - source: "salt://{{ tpldir }}/10-split-git.policy"
    - user: root
    - group: root
    - mode: '0664'

include:
  - features.split-git.template
  - features.split-git.client

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
