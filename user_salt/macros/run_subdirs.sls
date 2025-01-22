# Macro: run_subdirs  [dom0]
# ==========================

{% macro run_subdirs(directory) %}

{% set path = '/srv/user_salt/'~directory %}
{% for subdir in salt['file.readdir'](path) if subdir not in ['..','.'] and salt['file.directory_exists'])(path~subdir) %}

{{ slsdotpath }}__run_subdirs__{{ subdir }}:
  salt.state:
    - tgt: dom0
    - saltenv: user
    - sls:
      - {{ slsdotpath }}.{{ subdir }}
{% endfor %}

{% endmacro %}

# vim: set syntax=python ts=2 sw=2 sts=2 et:
