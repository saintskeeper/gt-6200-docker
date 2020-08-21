#!/bin/bash

set -o errexit
set -o nounset
set -o pipefail

sleep 99999

echo ""
exec "$@"