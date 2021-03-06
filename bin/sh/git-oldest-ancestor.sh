#!/usr/bin/env bash

# Outputs the SHA of the oldest common ancestor of two branches.
#
# The first argument defaults to `master` and the second argument defaults to `HEAD`.

ancestor=$(diff --old-line-format='' --new-line-format='' \
    <(git rev-list --first-parent "${1:-master}") \
    <(git rev-list --first-parent "${2:-HEAD}") | \
    head -1)

git rev-parse --short "$ancestor"

