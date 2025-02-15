# sls: Install template-vault packages [template-vault] 
# =====================================================

{{ slsdotpath }}_install_packages:
  pkg.installed:
    - pkgs:
      - pciutils
      - ip
     
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
