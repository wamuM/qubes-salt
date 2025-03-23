# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================================
# Deletes Menu Entries in template            [dom0]
# ===================================================
# Refer to ./template-input.jinja for relevant values

{%- import tpldir ~ "/template-input.jinja" as input -%}

{% if grains['nodename'] == 'dom0' %}

{{ slsdotpath }}_start_template:
  qvm.start:
    - name: {{ input.template_name }}

{{ slsdotpath }}_update:
  qvm.features:
    - name: {{ input.template_name }}
    - set:
      - menu-items: " "
      - default-menu-items: " "
  require:
    - qvm: {{ slsdotpath }}_start_template


{{ slsdotpath }}}_sync:
  cmd.run:
    - runas: {{ pillar['ENV']['dom0_user'] }}
    - name: qvm-sync-appmenus {{ input.template_name}}
  require:
    - qvm: {{ slsdotpath }}_update

{{ slsdotpath }}_shutdown:
  qvm.shutdown:
    - name: {{ input.template_name }}

{% endif %}
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
