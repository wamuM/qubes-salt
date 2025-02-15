# sls: Setup template-vault [dom0]
# ================================
{% from 'macros/run_as.sls' import run_as_dom0, run_as_vm %}

{{ slsdotpath }}_present:
  {{run_as_dom0( slsdotpath~".present" )}}

{{ slsdotpath }}_packages:
  {{run_as_vm("template-vault", slsdotpath~".packages")}}
  require:
    - salt: {{ slsdotpath }}_present

{{ slsdotpath }}_dom0_split_gpg:
  {{run_as_dom0( "dom0.split_gpg" )}}
  require:
    - cmd: {{ slsdotpath }}_packages

{{ slsdotpath }}_all:
  test.nop:
    - test: test 
  require:
    - salt: {{ slsdotpath }}_dom0_split_gpg
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
