# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ===================================================
# templatevm installation                  [template]
# ===================================================
# Include the software that you want installed here

include:
  # Install the packages specified in the template-input.jinja file:
  - {{ slsdotpath }}.simple_packages_installed 
  # Software that requires configuration: 

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
