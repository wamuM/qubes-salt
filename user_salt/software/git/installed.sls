# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================
# 	Installing git on Template
# =================================== 

{{ slsdotpath }}_installed:
  pkg.installed:
  - name: git 

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
