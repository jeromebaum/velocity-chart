#!/bin/sh

# run some command on every week's commit.
# 1. please have a clean working tree before you run this.
# 2. please be inside the working tree when you run this.
# 3. this only works on master right now and will leave master checked out.
# this is useful for getting the standard output, probably nothing else.

# takes these arguments:
# 1. how many weeks back should I look?
# 2. what command should I run? (will be passed to eval)

WEEKS_COUNT="$1"
MAP_COMMAND="$2"

for CURRENT_WEEK in $(seq "$WEEKS_COUNT" -1 0); do
  if [ "$CURRENT_WEEK" -eq 0 ]; then
    COMMIT=master
  else
    COMMIT="$(git rev-list -1 --before="$CURRENT_WEEK weeks ago" master)"
  fi
  git checkout "$COMMIT" >/dev/null
  eval "$MAP_COMMAND"
done

# vim: set et ts=2 sw=2 tw=76 fdm=marker:
