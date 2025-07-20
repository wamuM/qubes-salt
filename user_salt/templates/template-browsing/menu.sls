# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================================
# Deletes Menu Entries in template            [dom0]
# ===================================================
# Refer to ./template-input.jinja for relevant values

{%- import tpldir ~ "/template-input.jinja" as input -%}
{% from 'macros/update_menu.sls' import update_menu %}

{% if grains['nodename'] == 'dom0' %}

{{ update_menu( input.template_name, " ") }}

{% endif %}
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
