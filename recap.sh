#!/bin/bash
declare -a tableau_indi
count=0
>teeet.txt
somme=0
while IFS=" " read -ra ligne
do

        count=$(echo "$count + 1" | bc)
        somme=$(echo "$somme + $ligne" | bc)
        echo $ligne
done<<< $(cat Prix.txt)
moyenne=$(echo "$somme / $count" | bc)
valeurentree=$(cat Prix.txt | head -1)
valeursortie=$(cat Prix.txt | tail -1)
echo $valeurentree
echo $valeursortie
echo $moyenne
CHAT_ID=-1001876276898
curl -s --data chat_id=$CHAT_ID --data-urlencode "text=Valeur d entrée= $valeurentree
Valeur sortie= $valeursortie
Moyenne=$moyenne" "https://api.telegram.org/bot5722099198:AAHR87VgvswTd19OhyuWxOqJ9x7x0S7nZ4E/sendMessage?parse_mode"
>Prix.txt
