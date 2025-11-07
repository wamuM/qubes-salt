# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
# Split Git Backend
# ============================================

{{ slsdotpath }}_git_installed_backend:
  pkg.installed:
    - name: git 

{{ slsdotpath }}_install_rpc_handlers:
  file.recurse:
    - name: "/etc/qubes-rpc/"
    - source: "salt://{{ tpldir }}/services/"
    - user: root
    - group: root 
    - file_mode: '0755'
    - clean: False

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
