# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# =================================================================
# 	Common State to all CodingVMs [AppVM<template=template-coding>]
# =================================================================

{% if pillar['qubes']['template'] == 'template-coding' %}
{% from 'macros/update_menu.sls' import update_menu %}
# This needs to be run as dom0 smh
# {% set menuList = [
#   "org.suckless.st.desktop",
#   "librewolf.desktop",
# ] %}
# {{ update_menu(salt['id'], menuList) }}


{% endif %}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
