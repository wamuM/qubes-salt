# sls: Install template-browsing packages [template-browsing] 
# =====================================================

{{ slsdotpath }}_install_packages:
  pkg.installed:
    - pkgs:
      - pciutils
      - vim-minimal
      - less
      - psmisc
      - pipewire-qubes
      - qubes-core-agent-networking
      - qubes-core-agent-thunar
      - qubes-app-shutdown-idle
      - thunderbird
      - rssguard

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
