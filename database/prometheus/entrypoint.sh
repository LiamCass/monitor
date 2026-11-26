#!/bin/sh
# monitor/database/prometheus/entrypoint.sh
set -eu

env | sed 's/[\\&|]/\\&/g; s/\([^=]*\)=\(.*\)/s|${\1}|\2|g/' > /tmp/env.sed
sed -f /tmp/env.sed /etc/prometheus/config.template.yml > /prometheus/prometheus.yml

exec /bin/prometheus "$@"