# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ================================================
#   Add useful scripts to /usr/local/bin   [dom0]
# ================================================

{% set path = '/srv/user_salt/dom0/scripts/bin' %}
{% for script in salt['file.readdir'](path) 
   if salt['file.file_exists'](path~'/'~script) %}
{{ slsdotpath }}_script_{{script}}_softlink:
  file.managed:
    - name: {{"/usr/local/bin/"~script}}
    - source: {{ path~'/'~script }}
    - user: root
    - group: root
    - mode: 0755
    - force: true
{% endfor %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
