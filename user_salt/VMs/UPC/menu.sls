# sls: Update the menu [dom0]
# ===========================

{% from 'macros/update_menu.sls' import update_menu %}

{% set menu_entries = [
    'librewolf.desktop',
    'xterm.desktop', 
    'thunar.desktop'
] %}

{{ update_menu('UPC', menu_entries) }}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
