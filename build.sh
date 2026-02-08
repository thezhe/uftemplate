#!/usr/bin/env -S sh -euo pipefail
cd "$(dirname "${0}")"
./jbang 'org.jsonschema2pojo:jsonschema2pojo-cli:1.3.2' \
    --annotation-style JACKSON3 \
    --constructors-required-only \
    --generate-constructors \
    --long-integers \
    --omit-generated-annotation \
    --omit-hashcode-and-equals \
    --omit-tostring \
    --package 'src.build.json' \
    --remove-old-output \
    --source 'idl/json/' \
    --target 'build/' \
    --target-version '25' \
    --use-optional-for-getters \
    --use-title-as-classname
