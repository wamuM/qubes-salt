# sls: Setup basic git [dom0]
# =========================

{{ slsdotpath }}_installed:
  pkg.installed:
    - name: git

{{ slsdotpath }}_config_username:
  cmd.run:
    - name: git config --global user.name {{ pillar['identity']['name'] }}
  require:
    - pkg: {{ slsdotpath }}_git_installed

{{ slsdotpath }}_config_email:
  cmd.run:
    - name: git config --global user.email {{ pillar['identity']['email'] }}
  require:
    - pkg: {{ slsdotpath }}_git_installed

  
# vim: set syntax=yaml ts=2 sw=2 sts=2 et: 

