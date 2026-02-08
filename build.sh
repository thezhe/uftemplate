#!/usr/bin/env -S sh -euo pipefail
cd "$(dirname "${0}")"
rm -rf src/build/
./jbang 'org.jsonschema2pojo:jsonschema2pojo-cli:1.3.2' \
    --annotation-style 'JACKSON3' \
    --constructors-required-only \
    --generate-constructors \
    --long-integers \
    --omit-generated-annotation \
    --omit-hashcode-and-equals \
    --omit-tostring \
    --package 'src.build.json' \
    --source 'idl/json/' \
    --target '.' \
    --target-version '25' \
    --use-optional-for-getters \
    --use-title-as-classname
