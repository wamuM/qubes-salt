# SPDX-License-Identifier: Apache-2.0
# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# ========================
# pillar: Identity Data [*]
# ========================= 

identity:
  {% if grains['id'] == 'dom0' %}
  email: "contact@wamu-m.com"
  name: "wamu_M"  
  {% else %}
  email: "no@thankyou.com"
  name: "user"
  {% endif %}
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:

