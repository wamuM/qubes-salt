# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0 
# ========================================
# Orchestrate File for this template 
# =======================================

{% import tpldir ~ "/template-input.jinja" as input %}
{% from "macros/run_as.sls" import run_as_dom0, run_as_vm %}

{{ slsdotpath }}_created:
  {{ run_as_dom0( tpldot ~ ".created") }}

{{ slsdotpath }}_installed: 
  {{ run_as_vm( input.template_name, tpldot ~ ".installed") }}
  require:
    - qvm: {{ slsdotpath }}_created

{{ slsdotpath }}_extra: 
  {{ run_as_vm( input.template_name, tpldot ~ ".extra") }}
  require:
    - qvm: {{ slsdotpath }}_installed

{{ slsdotpath }}_menu:
  {{ run_as_dom0( tpldot ~ ".menu") }}
  require:
    - cmd: {{ slsdotpath }}_extra

# vim: set syntax=yaml ts=2 sw=2 sts=2 et:
