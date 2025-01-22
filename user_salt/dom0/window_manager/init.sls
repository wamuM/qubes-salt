# sls: Setup dom0 wm [dom0]
# =========================

{{ slsdotpath }}_awesome_installed:
  pkg.installed:
    - name: awesome

{{ slsdotpath }}_config_file:
  file.recurse:
    - name: "{{ pillar['ENV']['dom0_homedir'] }}/.config/awesome"
    - source: "salt://{{ slspath }}/config/"
    - user: root
    - group: root
    - file_mode: '0664'
    - dir_mode: '0755'
    - makedirs: True
  require:
    - pkg: {{ slsdotpath }}_awesome_installed
  
# vim: set syntax=yaml ts=2 sw=2 sts=2 et: 

