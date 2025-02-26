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
      - qubes-core-agent-thunar
      - qubes-app-shutdown-idle
      - qubes-core-agent-passwordless-root
      - vlc
      - eog
      - evince
      - ffmpeg-free
      - libreoffice 
  
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
