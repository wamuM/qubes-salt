# sls: Make the qube present [dom0]
# =================================
{{ slsdotpath }}_present:
  qvm.present:
    - name: ssh-charles 
    - template: template-coding
    - label: {{ pillar["labels"]['risky'] }}
    - mem: 400
    - vcpus: 1
  require:
    - qvm: VMs.template-coding_all

{{ slsdotpath }}_prefs:
  qvm.prefs:
    - name: ssh-charles 
    - netvm: sys-firewall
    - autostart: False 
  require:
    - qvm: {{ slsdotpath }}_present

{{ slsdotpath }}_tags:
  qvm.tags:
    - name: ssh-charles 
    - add:
      - risky 
      - ssh
      - charles
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
