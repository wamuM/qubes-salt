# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
#		        Rofi (for dom0)
# ============================================

{{ slsdotpath }}_rofi_installed:
  pkg.installed:
    - name: rofi 

{{ slsdotpath }}_clear_config_dir:
  file.absent:
    - name: "{{ pillar['ENV']['dom0_homedir'] }}/.config/rofi"

{{ slsdotpath }}_link_config_dir:
  file.recurse:
    - name: "{{ pillar['ENV']['dom0_homedir'] }}/.config/rofi"
    - source: "salt://{{ tpldir }}/config"
    - user: root
    - group: root
    - file_mode: '0755'
    - dir_mode: '0755'
    - force: True
    - makedirs: True
  require:
    - pkg: {{ slsdotpath }}_rofi_installed_
    - file: {{ slsdotpath }}_clear_config_dir


# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
