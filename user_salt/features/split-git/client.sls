# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
# Split Git Client
# ============================================

{{ slsdotpath }}_git_installed_client:
  pkg.installed:
    - name: git 

{{ slsdotpath }}_install_helpers:
  file.managed:
{% if grains['os_family'] == 'Debian' %}
    - name: "/usr/lib/git-core/git-remote-qrexec"
{% elif grains['os_family'] == "RedHat" %}
    - name: "/usr/libexec/git-core/git-remote-qrexec"
{% else %}
    - name: "/usr/libexec/git-core/git-remote-qrexec"
{% endif %}
    - source: "salt://{{ tpldir }}/remote-helpers/git-remote-qrexec"
    - user: root
    - group: root 
    - mode: '0755'

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
