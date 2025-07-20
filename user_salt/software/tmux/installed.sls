# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================
# 	Installing tmux on Template
# =================================== 

{{ slsdotpath }}_installed:
  pkg.installed:
    - name: tmux

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
