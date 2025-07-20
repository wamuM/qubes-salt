# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0 
# =============================================
# macro: Execute something as dom0/appvm [dom0]
# =============================================
# CAREFUL: they do not have ids
{% macro run_as_dom0(sls) %}
  salt.state:
    - tgt: dom0
    - saltenv: user
    - sls:
      - {{ sls }}
{% endmacro %}

{% macro run_as_vm(vm, sls) %}
  cmd.run:
    - name: qubesctl --skip-dom0 --target {{ vm }} state.apply {{ sls }} saltenv=user
{% endmacro %}
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
