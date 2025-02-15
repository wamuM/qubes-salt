# sls: Setup template-browsing [dom0]
# ================================
{% from 'macros/run_as.sls' import run_as_dom0, run_as_vm %}

{{ slsdotpath }}_present:
  {{run_as_dom0( slsdotpath~".present" )}}

{{ slsdotpath }}_packages:
  {{run_as_vm("template-browsing", slsdotpath~".packages")}}
  require:
    - salt: {{ slsdotpath }}_present

{{ slsdotpath }}_all:
  test.nop:
    - test: test 
  require:
    - salt: {{ slsdotpath }}_packages
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
