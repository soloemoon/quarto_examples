#! /bin/sh
cd "$(dirname "$0")"

params=("html" "pdf")

for n in "${params[@]}";
do
    quarto render '/Users/solomonmoon/Documents/Quarto Examples/Output to Different Formats/Different Formats.qmd' --to "$n" 
done