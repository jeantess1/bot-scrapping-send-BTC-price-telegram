#!/bin/bash
declare -a tableau_indi
count=0
somme=0
moyenne=0
fichier=/home/ec2-user/projet_scraping/Prix.txt
while read line
do
        count=$(echo "$count+1" | bc)
        somme=$(echo "$somme + $line" | bc)
        moyenne=$(echo "scale=2;$somme / $count" | bc)

done<"$fichier"
valeurentree=$(cat Prix.txt | head -1)
valeursortie=$(cat Prix.txt | tail -1)
max=$(cat Prix.txt| sort -n | tail -1)
min=$(cat Prix.txt| sort -n | head -1)
dat=$(date)
CHAT_ID=-<CHAT_ID>
curl -s --data chat_id=$CHAT_ID --data-urlencode "text=$dat

Valeur d'entrée=\$$valeurentree
Valeur sortie= \$$valeursortie
Valeur Min= \$$min
Valeur Max= \$$max
Moyenne=\$$moyenne" "https://api.telegram.org/bot<tokenID>/sendMessage?parse_mode"

>$fichier
