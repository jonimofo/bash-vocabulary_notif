#!/bin/bash


## Function
function get_word() {
    # -n = quiet (suppress automatic printing of pattern space)
    # -e = command to be executed
    # -p = print
    sed -n $1p ${vocab_file}
}

# Display popup  
function display_popup() {
    zenity --notification --text $1
}



## Variables
vocab_file="$HOME/Repos/popup-vocabulary/vocabulary.txt"
line_count="$(wc -l ${vocab_file} | cut -d " " -f1)"
rand_line=$(shuf -i 1-$line_count -n1)
random_word=$(get_word $rand_line)


display_popup $random_word
