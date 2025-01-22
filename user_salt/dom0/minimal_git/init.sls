# sls: Setup basic git [dom0]
# =========================

{{ slsdotpath }}_installed:
  pkg.installed:
    - name: git

{{ slsdotpath }}_config_username:
  git.config:
    - name: user.name
    - value: {{ pillar['identity']['name'] }}
    - global: True
  require:
    - pkg: {{ slsdotpath }}_git_installed

{{ slsdotpath }}_config_email:
  git.config:
    - name: user.email
    - value: {{ pillar['identity']['email'] }}
    - global: True
  require:
    - pkg: {{ slsdotpath }}_git_installed

  
# vim: set syntax=yaml ts=2 sw=2 sts=2 et: 

