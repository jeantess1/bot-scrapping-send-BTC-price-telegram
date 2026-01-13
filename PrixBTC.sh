#!/bin/bash

curl https://fr.investing.com/crypto/bitcoin/btc-usd > prix_btc.txt
Prix=$(cat prix_btc.txt | grep -oP '(?<=instrument-price-last">).*(?=</span><div class="text-xl flex items-end flex-wrap)'|tr -d "."| sed -r 's/[,]+/./g')
date=$(date)

echo $Prix >> Prix.txt
echo $Prix $date >> HistoriqueDesPrix.txt


debut="La valeur du BTC est: "
fin="Dollars"
total="$debut$Prix$fin"

API_KEY=<APII_KEY>
CHAT_ID=-<CHAT_ID>
curl -s --data chat_id=$CHAT_ID --data-urlencode "text=La valeur actuelle du BTC est: $Prix $" "https://api.telegram.org/bot<BOT_ID>/sendMessage?parse_mode"
~       
