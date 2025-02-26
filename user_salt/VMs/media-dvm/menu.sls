# sls: Update the menu [dom0]
# ===========================

{% from 'macros/update_menu.sls' import update_menu %}

{% set menu_entries = [
    'xterm.desktop',
    'org.gnome.Evince.desktop',
    'org.gnome.eog.desktop',
    'vlc.desktop'
] %}

{{ update_menu('media-dvm', menu_entries) }}

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
