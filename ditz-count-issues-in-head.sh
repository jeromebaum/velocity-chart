#!/bin/sh

# for now, single argument: bugs dir.
BUGS_DIR="$1"

# open issues
BUGS_OPEN="$(grep -P '^disposition: $' "$BUGS_DIR"/issue-*.yaml | wc -l)"
# fixed issues
BUGS_FIXED="$(grep -P '^disposition: :fixed$' "$BUGS_DIR"/issue-*.yaml | wc -l)"
# total issues (not counting wontfix and reorg)
BUGS_TOTAL=$(($BUGS_OPEN + $BUGS_FIXED))

echo $BUGS_OPEN $BUGS_FIXED $BUGS_TOTAL
