#! /bin/sh
cd "$(dirname "$0")"

params=("Iris-setosa" "Iris-versicolor" "Iris-virginica")

for n in "${params[@]}";
do
    quarto render '/Users/solomonmoon/Documents/Quarto Examples/Parameterized Report/Parameterized Report.qmd' --output "$n.pdf" -P species:"$n" 
done

