#!/usr/bin/env bash
# stop for role: sarvjeet  (implementation: scripts/role.sh)
set -euo pipefail
exec "$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)/scripts/role.sh" sarvjeet stop "$@"
