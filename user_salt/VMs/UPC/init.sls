# sls: Setup UPC [dom0]
# ================================
{% from 'macros/run_as.sls' import run_as_dom0, run_as_vm %}

{{ slsdotpath }}_present:
  {{run_as_dom0( slsdotpath~".present" )}}

{{ slsdotpath }}_menu:
  {{run_as_dom0( slsdotpath~".menu")}}
  require:
    - salt: {{ slsdotpath }}_present

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
