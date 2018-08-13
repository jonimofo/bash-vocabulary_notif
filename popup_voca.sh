#!/bin/bash

# TODO 
# Check des packages zenity / translate shell
# laisser une variable pour la langue ?
# laisser la possibilité d'avoir la traduction complète ? (pas trouvé comment on fait encore)

function get_random_line {
    line_count="$(wc -l ${vocab_file} | cut -d " " -f1)"
    random_line=$(shuf -i 1-$line_count -n1)
    echo $random_line
}

function get_word {
    # -n = quiet (suppress automatic printing of pattern space)
    # -p = print
    sed -n $1p ${vocab_file}
}

function translate {
    trans -b :fr $1
}

function display_popup {
    zenity --notification --timeout=3 --text "$1 \\n 
$2"
    #TODO change time duration / color / brightness
}


## Variables
vocab_file="$HOME/Repos/popup-vocabulary/vocabulary.txt"
random_line=$(get_random_line)
random_word=$(get_word $random_line)


# if an empty line is picked
while [ -z "$random_word" ]; do
    random_line=$(get_random_line)
    random_word=$(get_word $random_line)
done 

translation=$(translate $random_word)


display_popup $random_word $translation  
