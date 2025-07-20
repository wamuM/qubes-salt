# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0 
# =============================================
# macro:  Set Trust Level 
# =============================================
# As specified in user_pillar/labels.sls

{% macro set_trust_level(vm, trustlevel) %} 

{{ slsdotpath }}__set_trust_level__{{ vm }}__label:
  qvm.prefs:
    - name: {{ vm }}
    - label: {{ pillar['labels'][trustlevel] }}

{{ slsdotpath }}__set_trust_level__{{ vm }}__tag:
  qvm.tags:
    - name: {{ vm }}
    - add:
      - trust_{{ trustlevel }}

{% endmacro %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
