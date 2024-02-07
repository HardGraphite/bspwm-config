#!/bin/sh

declare -A tools=(
    ['USB Storage Devices Control']='udisksctl.sh'
    ['Power Menu']='power.sh'
    ['Lock Screen']='lockscr.sh'
)

script=$(dirname $(readlink -f "$0"))/${tools[$(printf '%s\n' "${!tools[@]}" | rofi -no-plugins -dmenu -i -p 'Tool')]}
[ -f "$script" ] && exec "$script"
