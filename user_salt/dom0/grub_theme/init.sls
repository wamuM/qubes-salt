# sls: Setup grub menu theme [dom0]
# ================================

{{ slsdotpath }}_copy_theme:
  file.recurse:
    - name: "/boot/grub2/themes/minegrub-world-selection"
    - source: "salt://dom0/grub_theme/minegrub-theme/"
    - user: root
    - group: root
    - file_mode: '0770'
    - dir_mode: '0770'
    - makedirs: True

{{ slsdotpath }}_mkconfig:
  cmd.run:
    - name: grub2-mkconfig -o /boot/grub2/grub.cfg 
  require:
    - file: {{ slsdotpath }}_copy_theme

# vim: set syntax=yaml ts=2 sw=2 sts=2 et: 

