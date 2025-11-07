# SPDX-FileCopyrightText: 2025 Marcel M. T. (wamu_M) <contact@wamu-m.com>
# SPDX-License-Identifier: Apache-2.0
# ============================================
# 	Runs all dom0 states      [dom0]
# ============================================

{% from 'macros/run_subdirs.sls' import run_subdirs %}
{{ run_subdirs( tpldir, ["software"]) }}


