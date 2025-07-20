# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# =============================================
#   Configure split-gpg backend template 
# =============================================

{{ slsdotpath }}_install_packages:
  pkg.installed:
    - pkgs:
      - split-gpg2
      - gnupg2
      # for security cards
      - qubes-usb-proxy

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
