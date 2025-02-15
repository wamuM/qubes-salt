# sls: Make the qube present [dom0]
# =================================
{{ slsdotpath }}_present:
  qvm.present:
    - name: vault-passwords
    - template: template-vault 
    - label: {{ pillar["labels"]['full-trust'] }}
    - mem: 400
    - vcpus: 1
  require:
    - qvm: VMs.template-vault_all

{{ slsdotpath }}_prefs:
  qvm.prefs:
    - name: vault-passwords
    - netvm: none
    - autostart: True
  require:
    - qvm: {{ slsdotpath }}_present

{{ slsdotpath }}_tags:
  qvm.tags:
    - name: vault-passwords
    - add:
      - full_trust

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
