# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================
# 	Installing ST on template	
# =================================== 


{{ slsdotpath }}_git_installed:
  pkg.installed:
    - name: git

{{ slsdotpath }}_clone_source:
  cmd.run:
    - name: "rm -rf /usr/src/st && git clone http://git.suckless.org/st /usr/src/st"
    - env:
      - http_proxy: "http://127.0.0.1:8082"
      - HTTP_PROXY: "http://127.0.0.1:8082"
    - runas: root
  require:
    - pkg: {{ slsdotpath }}_git_installed

{{ slsdotpath }}_hidden_dependencies:
  pkg.installed:
  - pkgs:
    - libX11-devel
    - libXft-devel
  require:
    - cmd: {{ slsdotpath }}_clone_source

{{ slsdotpath }}_custom_build_file:
  file.managed:
    - name: "/usr/src/st/config.mk"
    - source: "salt://{{ tpldir }}/config.mk"
    - user: root
    - group: root
    - mode: '0644'
  require:
    - cmd: {{ slsdotpath }}_clone_source

{{ slsdotpath }}_build:
  cmd.run:
    - name: "make clean install"
    - cwd: "/usr/src/st"
    - runas: root
  require:
    - pkg: {{ slsdotpath }}_hidden_dependencies
    - cmd: {{ slsdotpath }}_custom_build_file

{{ slsdotpath }}_desktop_entry:
  file.managed:
    - name: "/usr/share/applications/org.suckless.st.desktop"
    - source: "salt://{{ tpldir }}/st.desktop"
    - user: root
    - group: root
    - mode: '0755'
  require:
    - cmd: {{ slsdotpath }}_build
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
