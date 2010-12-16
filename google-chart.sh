#!/bin/sh

MAX_VAL=0
MIN_VAL=0
URL="http://chart.apis.google.com/chart?cht=lc"
open_series=""
fixed_series=""
total_series=""

while read open fixed total; do
  if [ $MAX_VAL -lt $open ]; then
    MAX_VAL=$open
  fi
  if [ $MAX_VAL -lt $fixed ]; then
    MAX_VAL=$fixed
  fi
  if [ $MAX_VAL -lt $total ]; then
    MAX_VAL=$total
  fi

  open_series="$open_series,$open"
  fixed_series="$fixed_series,$fixed"
  total_series="$total_series,$total"
done

open_series=${open_series:1}
fixed_series=${fixed_series:1}
total_series=${total_series:1}

URL="$URL&chs=800x375"
URL="$URL&chco=ff0000,00ff00,0000ff"
URL="$URL&chdl=Open|Fixed|Total"
URL="$URL&chg=100,10"
URL="$URL&chd=t:$open_series|$fixed_series|$total_series"
URL="$URL&chds=$MIN_VAL,$MAX_VAL"
URL="$URL&chxr=0,$MIN_VAL,$MAX_VAL"
URL="$URL&chxt=y"

curl "$URL"
