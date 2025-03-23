# SPDX-FileCopyrightText: 2023 Benjamin Grande M. S. <ben.grande.b@gmail.com> 
# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: AGPL-3.0-or-later
# ====================================
# templatevm creation template [dom0]
# ====================================
# Refer to ./template-input.jinja for relevant values

{% import tpldir ~ "/template-input.jinja" as input %}

{% if grains['nodename'] == 'dom0' %}

{{ slsdotpath }}_base_template:
  qvm.template_installed:
    - name: {{ input.base_template }}

{{ slsdotpath }}_cloned_base:
  qvm.clone:
    - name: {{ input.template_name }}
    - source: {{ input.base_template }}
  require:
    - qvm: {{ slsdotpath }}_base_template

{{ slsdotpath }}_label:
  qvm.prefs:
    - name: {{ input.template_name }}
    - label: {{ pillar['labels']['template'] }}
  require:
    - qvm: {{ slsdotpath }}_cloned_base

{% endif %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
