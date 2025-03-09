# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================================
# templatevm package installation template [template]
# ===================================================
# Refer to ./template-input.jinja for relevant values

{% import tpldir ~ "/template-input.jinja" as input %}

{% if grains['nodename'] != 'dom0' %}

{{ slsdotpath }}_packages_installed:
  pkg.installed:
    {% for package in input.simple_packages %}
    - {{ package }}
    {% endfor %}

{% endif %}


# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
