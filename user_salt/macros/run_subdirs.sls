# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0 
# =============================================
# macro: Run All States in a dir[dom0]
# =============================================

{% macro run_subdirs(directory,excluded=[]) %}
  {% set path = '/srv/user_salt/'~directory %}
  {% for subdir in salt['file.readdir'](path) 
  if subdir not in ['..','.'] 
  and subdir not in excluded
  and salt['file.directory_exists'](path~'/'~subdir) %}
{{ slsdotpath }}__run_subdirs__{{ subdir }}:
  salt.state:
    - tgt: dom0
    - saltenv: user
    - sls:
      - {{ slsdotpath }}.{{ subdir }}
  {% endfor %}
{% endmacro %}

# vim: set syntax=python ts=2 sw=2 sts=2 et:
