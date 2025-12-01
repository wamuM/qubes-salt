# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================================
# templatevm extra states [template]
# ===================================================
# Refer to ./template-input.jinja for relevant values

{% import tpldir ~ "/template-input.jinja" as input %}


{{ slsdotpath }}_NOP:
  test.nop:
    - comment: "Filler action"
  
{% if grains['nodename'] != 'dom0' %}
{% if input.extra %}
include:
  {% for state in input.extra %}
  - {{ state }}
  {% endfor %}
{% endif %}
{% endif %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
