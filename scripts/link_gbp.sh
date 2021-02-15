#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}"  )" && pwd  )"
source "$CURRENT_DIR/helpers.sh"

api_status=$(curl -s  https://api.kraken.com/0/public/SystemStatus | jq '.result.status'| sed 's/\"//g')

get_price()
{
    price=$(curl -s  https://api.kraken.com/0/public/Ticker?pair=LINKEUR| jq '.result.LINKEUR.a[0]' | sed 's/\"//g')

    if [[ $api_status == 'online' ]]; then
        echo -e "$price" | bc -l | awk '{printf "LINK: %.2f£", $1}'
    elif [[ $api_sttaus == 'offline' ]]; then
        echo "API offline"
    else
        echo "Error, No internet"
    fi
}

get_price

