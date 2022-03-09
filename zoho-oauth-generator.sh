#!/bin/sh

#iniialization

echo "zoho generate OAuth 2.0 Token"
read -p "Enter Grant token: " grantToken
read -p "Enter ClientID: " clientID
read -p "Enter ClientSecret: " clientSecret

US="https://accounts.zoho.com"
AU="https://accounts.zoho.com.au"
EU="https://accounts.zoho.com.au"
IN="https://accounts.zoho.in"
CN="https://accounts.zoho.com.cn"
JP="https://accounts.zoho.jp"
myArray=("US" "AU" "EU" "IN" "CN" "JP")
# printf "US/AU/EU/IN/CN/JP , default US\n"
# read -p "Choose data center: " dataCenter

# arrayLength=${#myArray[@]}
# for (( i=0;i<${arrayLength};i++)); do
#   if [ $dataCenter=${myArray[$i]} ]
#   then
#     dataCenter="${${myArray[$i]}}"
#   else
#     dataCenter="$US"
#   fi
# done

dataCenter="$AU/oauth/v2/token"
echo "$dataCenter"
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=authorization_code&code=${grantToken}&client_id=${clientID}&client_secret=${clientSecret}" ${dataCenter} 
