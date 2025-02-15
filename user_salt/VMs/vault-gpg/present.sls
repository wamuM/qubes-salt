# sls: Make the qube present [dom0]
# =================================
{{ slsdotpath }}_present:
  qvm.present:
    - name: vault-gpg
    - template: template-vault 
    - label: {{ pillar["labels"]['full-trust'] }}
    - mem: 400
    - vcpus: 1
  require:
    - qvm: VMs.template-vault_all

{{ slsdotpath }}_prefs:
  qvm.prefs:
    - name: vault-gpg
    - netvm: none
    - autostart: True
  require:
    - qvm: {{ slsdotpath }}_present

{{ slsdotpath }}_tags:
  qvm.tags:
    - name: vault-gpg
    - add:
      - split_gpg_server
      - full_trust

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
