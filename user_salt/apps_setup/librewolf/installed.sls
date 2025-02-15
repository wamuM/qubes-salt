# sls: Install librewolf into the target [*]
# =========================================

{% if grains['os_family'] | lower == 'debian' %}

{{ slsdotpath }}_install_extrepo:
  pkg.installed:
    - name: extrepo

{{ slsdotpath }}_add_repo:
  cmd.run:
    - name: extrepo enable librewolf
    - env:
      - HTTPS_PROXY: http:/127.0.0.1:8082
    - runas: root

{% elif grains['os_family'] | lower == 'redhat' %}

{{ slsdotpath }}_copy_gpg_key:
  file.managed:
    - name: /etc/pki/rpm-gpg/RPM-GPG-KEY-librewolf
    - source: salt://{{ tpldir }}/librewolf.asc
    - user: root
    - group: root
    - mode: '0774'

{{ slsdotpath }}_copy_repo:
  file.managed:
    - name: /etc/yum.repos.d/librewolf.repo
    - source: salt://{{ tpldir }}/librewolf.repo
    - template: jinja
    - user: root
    - group: root
    - mode: '0774'

{{ slsdotpath }}_config_manager:
  cmd.run:
    - name: dnf config-manager --set-enabled librewolf

{% endif %}

{{ slsdotpath }}_set_up_to_date:
  pkg.uptodate:
    - refresh: True

{{ slsdotpath }}_installed:
  pkg.installed:
    - name: librewolf

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
