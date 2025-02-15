# sls: Apply all VM states [dom0]
# ===============================

{% from 'macros/run_subdirs.sls' import run_subdirs %}
{{ run_subdirs( tpldir ) }}


# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
