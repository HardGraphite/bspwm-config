#!/bin/sh

# https://github.com/google/xsecurelock

case "$1" in
auto)
    xset s on
    xset s 600 5 # TIME_LOCK TIME_DIM (sec)
    exec env \
    XSECURELOCK_AUTH_BACKGROUND_COLOR='#495bab' \
    XSECURELOCK_AUTH_FOREGROUND_COLOR='#cfbc97' \
    XSECURELOCK_AUTH_WARNING_COLOR='#f04040' \
    XSECURELOCK_AUTH_TIMEOUT=30 \
    XSECURELOCK_BACKGROUND_COLOR='#082010' \
    XSECURELOCK_BLANK_TIMEOUT=60 \
    XSECURELOCK_PASSWORD_PROMPT=asterisks \
    XSECURELOCK_SHOW_KEYBOARD_LAYOUT=0 \
    XSECURELOCK_COMPOSITE_OBSCURER=0 \
    XSECURELOCK_SHOW_DATETIME=1 \
    XSECURELOCK_DATETIME_FORMAT='%F %a %T' \
    xss-lock -n /usr/lib/xsecurelock/dimmer -l -- xsecurelock
    ;;
noauto)
    xset s default
    xset s off
    pkill -SIGTERM --exact xss-lock
    ;;
now)
    ;&
'')
    exec xset s activate
    ;;
*)
    echo 'usage:' $0 '[[no]auto|now]'
    exit 1
    ;;
esac
