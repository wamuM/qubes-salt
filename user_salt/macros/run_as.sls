# macro: Execute something as dom0/appvm [dom0]
# =============================================
# CAREFUL: they do not have ids
{% macro run_as_dom0(sls) %}
  salt.state:
    - tgt: dom0
    - saltenv: user
    - sls:
      - {{ sls }}
{% endmacro %}

{% macro run_as_vm(vm, sls) %}
  cmd.run:
    - name: qubesctl --skip-dom0 --target {{ vm }} state.apply {{ sls }} saltenv=user
{% endmacro %}
# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
