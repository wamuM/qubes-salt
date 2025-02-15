# sls: Install template-vault packages [template-vault] 
# =====================================================

{{ slsdotpath }}_install_packages:
  pkg.installed:
    - pkgs:
      - keepassxc
      - split-gpg2
      - gnupg2	
      # for security keys
      - qubes-usb-proxy
     
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
