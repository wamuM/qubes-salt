# sls: Install template-vault [dom0] 
# ==================================

{% set base_template = "fedora-40-minimal" %}

{{ slsdotpath }}_base_template:
  qvm.template_installed:
    - name: {{ base_template }}

{{ slsdotpath }}_clone_base:
  qvm.clone:
    - name: template-vault
    - source: {{ base_template }}
  require:
    - qvm: {{ slsdotpath }}_base_template

{{ slsdotpath }}_prefs:
  qvm.prefs:
    - name: template-vault
    - label: {{ pillar['labels']['template'] }}
  require:
    - qvm: {{ slsdotpath }}_clone_base
  
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:

