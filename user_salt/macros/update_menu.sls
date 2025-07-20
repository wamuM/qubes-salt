# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0 
# ========================================
# macro: update freedesktop menu entries
# =======================================

{% macro update_menu(appvm, appList) %}
{{ slsdotpath }}__update_menu__{{ appvm }}_start_vm:
  qvm.start:
    - name: {{ appvm }}


{{ slsdotpath }}__update_menu__{{ appvm }}_update:
  qvm.features:
    - name: {{ appvm }}
    - set:
      - menu-items: "{{ appList | join(' ') }}"
      - default-menu-items: "{{ appList | join(' ') }}"
  require:
    - qvm: {{ slsdotpath }}__update_menu__{{ appvm }}_start_vm


{{ slsdotpath }}__update_menu__{{ appvm }}_sync:
  cmd.run:
    - runas: {{ pillar['ENV']['dom0_user'] }}
    - name: qvm-sync-appmenus {{ appvm }}
  require:
    - qvm: {{ slsdotpath }}__update_menu__{{ appvm }}_update

{{ slsdotpath }}__update_menu__{{ appvm }}_shutdown:
  qvm.shutdown:
    - name: {{ appvm }}

{% endmacro %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
