# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================================
# templatevm extra states [template]
# ===================================================
# Refer to ./template-input.jinja for relevant values

{% import tpldir ~ "/template-input.jinja" as input %}

{% if grains['nodename'] != 'dom0' %}
include:
  {% for state in input.extra %}
  - {{ state }}
  {% endfor %}
{% endif %}
