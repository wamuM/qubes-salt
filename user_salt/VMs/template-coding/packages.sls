# sls: Install template-browsing packages [template-browsing] 
# =====================================================

{{ slsdotpath }}_install_packages:
  pkg.installed:
    - pkgs:
      - pciutils
      - vim-minimal
      - less
      - psmisc
      - gnome-keyring 
      - pipewire-qubes
      - qubes-core-agent-networking
      - qubes-core-agent-passwordless-root
      - qubes-core-agent-thunar
      - qubes-app-shutdown-idle
      - git
      - gcc
      - openssh
      - gdb

include: 
  - apps_setup.librewolf.installed
  
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
