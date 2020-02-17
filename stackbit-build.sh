#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5e4a43ef7a6b28001b48747e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5e4a43ef7a6b28001b48747e
curl -s -X POST https://api.stackbit.com/project/5e4a43ef7a6b28001b48747e/webhook/build/ssgbuild > /dev/null
gatsby build
curl -s -X POST https://api.stackbit.com/project/5e4a43ef7a6b28001b48747e/webhook/build/publish > /dev/null
