#!/usr/bin/env sh

set -eu

if [ -z "${FLY_APP_NAME:-}" ]; then
  echo "Starting CockroachDB with local options..."

  exec /cockroach/cockroach start-single-node \
    --insecure \
    --logtostderr
else
  echo "Starting CockroachDB with Fly.io options..."

  exec /cockroach/cockroach start \
    --advertise-addr="$(hostname -s).vm.${FLY_APP_NAME}.internal" \
    --cluster-name="${FLY_APP_NAME}" \
    --http-addr "0.0.0.0" \
    --insecure \
    --join="${FLY_APP_NAME}.internal" \
    --locality=region="${FLY_REGION}" \
    --logtostderr
fi
