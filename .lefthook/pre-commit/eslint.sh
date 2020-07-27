#!/usr/bin/env bash

git diff HEAD --name-only --diff-filter=ACM | grep '.js$' | xargs node ./node_modules/eslint/bin/eslint.js --quiet
