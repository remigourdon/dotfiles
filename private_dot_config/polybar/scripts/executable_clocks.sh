#!/bin/bash
# Script to display multiple clocks in polybar
set -Eeuo pipefail

unix_timestamp="$(date +%s)"

local_clock="$(date --rfc-3339=seconds --date @${unix_timestamp})"
utc_clock="$(date --rfc-3339=seconds --utc --date @${unix_timestamp})"

echo "${local_clock} | ${utc_clock} | ${unix_timestamp}"
