# sls: Make the qube present [dom0]
# =================================
{{ slsdotpath }}_present:
  qvm.present:
    - name: UPC 
    - template: template-coding
    - label: {{ pillar["labels"]['normal'] }}
    - mem: 400
    - vcpus: 1
  require:
    - qvm: VMs.template-coding_all

{{ slsdotpath }}_prefs:
  qvm.prefs:
    - name: UPC 
    - netvm: sys-firewall
    - autostart: False 
  require:
    - qvm: {{ slsdotpath }}_present

{{ slsdotpath }}_tags:
  qvm.tags:
    - name: UPC 
    - add:
      - normal 

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
