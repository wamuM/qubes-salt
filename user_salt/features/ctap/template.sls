# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
#	Install Necessary deps for ctap
# ============================================

{{ slsdotpath }}_install_ctap:
  pkg.installed:
    - name: "qubes-ctap"

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
