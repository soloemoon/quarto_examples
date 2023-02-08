#! /bin/sh
cd "$(dirname "$0")"

params=("html" "pdf")

for n in "${params[@]}";
do
    quarto render '/Users/solomonmoon/Documents/Quarto Examples/Parameterized Report/Parameterized Report.qmd' --to "$n" 
done