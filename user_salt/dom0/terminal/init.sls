# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
# 	Setup bash enviroment on dom0   [dom0]
# ============================================
# This file configures things like vim and bash 
# so coding in dom0 as root is bearable. It also 
# installs a few utils using qubes-update-dom0.

{{ slsdotpath }}_bashrc:
  file.managed:
    - name: "/root/.bashrc"
    - source: salt://{{ tpldir }}/files/bashrc
    - user: root
    - group: root
    - mode: 0600

{{ slsdotpath }}_vimrc:
  file.managed:
    - name: "/root/.vimrc"
    - source: salt://{{ tpldir }}/files/vimrc
    - user: root
    - group: root
    - mode: 0600

{{ slsdotpath }}_packages:
  pkg.installed:
    - reuse


# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
