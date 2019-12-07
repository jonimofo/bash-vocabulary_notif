#!/bin/bash
#Date: 12/04/19

DEFAULT_TEXT_FILE="$PWD/list.txt"
DEFAULT_NOTIF_TIMEOUT=1

function display_notif {
    zenity --notification --timeout=$DEFAULT_NOTIF_TIMEOUT --text "$1"
}

function get_random_line {
    line_count="$(wc -l ${DEFAULT_TEXT_FILE} | awk '{print $1}')"
    random_line=$(( $RANDOM % line_count + 1 ))

    if [[ $random_line -eq 0 ]]; then
        random_line=$((random_line + 1))
        echo "+ 1" $random_line
    fi

    line=$(sed -n "${random_line}"p ${DEFAULT_TEXT_FILE})

    display_notif "$line"
}

get_random_line
