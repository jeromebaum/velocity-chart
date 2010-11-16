#!/bin/sh

# arguments:
# 1. bugs dir
# 2. weeks
BUGS_DIR="$1"
WEEKS="$2"

TEMP_DIR="$(mktemp -d)"
cp "$0/../ditz-count-issues-in-head.sh" "$TEMP_DIR"
cp "$0/../git-map-weekly-commits.sh" "$TEMP_DIR"

sh "$TEMP_DIR"/git-map-weekly-commits.sh "$WEEKS" \
  "sh $TEMP_DIR/ditz-count-issues-in-head.sh $BUGS_DIR" \
  2>/dev/null

rm -fr "$TEMP_DIR"

# vim: set et ts=2 sw=2 tw=76 fdm=marker:
