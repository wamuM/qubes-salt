# sls: Make the qube present [dom0]
# =================================
{{ slsdotpath }}_present:
  qvm.present:
    - name: media-dvm
    - template: template-media
    - label: {{ pillar["labels"]['no-trust'] }}
    - mem: 400
    - vcpus: 1
  require:
    - qvm: VMs.template-media_all

{{ slsdotpath }}_prefs:
  qvm.prefs:
    - name: media-dvm
    - netvm: none
    - dispvm-allowed: True
  require:
    - qvm: {{ slsdotpath }}_present

{{ slsdotpath }}_tags:
  qvm.tags:
    - name: media-dvm
    - add:
      - no_trust	 

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
