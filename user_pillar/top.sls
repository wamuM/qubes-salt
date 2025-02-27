# SPDX-License-Identifier: Apache-2.0 
# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com> 
# ===== User Defined Salt Pillars =======================================
user:
  'dom0':
    - labels
  '*':
    - identity 
    - ENV 
# vim: set syntax=yaml ts=2 sw=2 sts=2 et :
   
