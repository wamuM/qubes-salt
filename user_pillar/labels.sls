# pillar: Color Labels for every VM category [dom0]
# ================================================
# The color represents the level of importance the data that vm holds has
labels:
  # ====================
  #      template
  # ====================
  # Should never be executed by the user
  # ------
  # i.e template-vault 
  template: black
  # ====================
  #     sys-trusted 
  # ====================
  # Service-vms trusted by the user 
  # ------
  # i.e sys-firewall 
  sys-trusted: white
  # ====================
  #     sys-untrusted 
  # ====================
  # Service-vms untrusted by the user, normally because they are 
  # too connected to the outside
  # ------
  # i.e sys-net, sys-usb
  sys-untrusted: purple 
  # ====================
  #     full-trust 
  # ====================
  # appvms trusted by the user to contain critical information like
  # passwords, top-secret documents, GPG keys, Revoke Certs, etc
  # ------
  # i.e vault-passwords 
  # [bunker with biometrics and bodyguards killer robots]
  full-trust: blue
  # ====================
  #       trusted
  # ====================
  # appvms trusted for day to day use of offline and limited online, open source, apps
  # ------
  # i.e notebook, etc
  # [inside your house] 
  trusted: green 
  # ====================
  #     normal trust 
  # ====================
  # Things you would not be affraid to do outside
  # ------
  # i.e ssh(not the keys!!), browsing the web
  # [whilst travelling]
  normal: yellow
  # ====================
  #       Risky 
  # ====================
  # Things that at any point could get stolen and it would be sad but not the end of
  # your life.
  # ------
  # one-time web searches 
  # [in your wallet in a tourist street filled with people]
  risky: orange 
  # ====================
  #       No trust 
  # ====================
  # Trivial, non private, non personal data
  # ------
  # [broadcasted to the world, and on every single billboard] 
  no-trust: red
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
