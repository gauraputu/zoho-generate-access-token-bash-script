#!/bin/sh

#iniialization

echo "zoho refresh Token OAuth2.0"
read -p "Enter refresh token: " refreshToken
read -p "Enter ClientID: " clientID
read -p "Enter ClientSecret: " clientSecret

US="https://accounts.zoho.com"
AU="https://accounts.zoho.com.au"
EU="https://accounts.zoho.eu"
IN="https://accounts.zoho.in"
CN="https://accounts.zoho.com.cn"
JP="https://accounts.zoho.jp"
myArray=("US" "AU" "EU" "IN" "CN" "JP")
printf "US/AU/EU/IN/CN/JP , default US\n"
read -p "Choose data center: " dataCenter

# echo "dataCenter val: ${dataCenter}"
if [ ${dataCenter} == 'US' ];then
  dataCenter="$US/oauth/v2/token"
elif [ ${dataCenter} == 'AU' ];then
  dataCenter="$AU/oauth/v2/token"
elif [ ${dataCenter} == 'EU' ];then
  dataCenter="$EU/oauth/v2/token"
elif [ ${dataCenter} == 'IN' ];then
  dataCenter="$IN/oauth/v2/token"
elif [ ${dataCenter} == 'CN' ];then
  dataCenter="$CN/oauth/v2/token"
elif [ ${dataCenter} == 'JP' ];then
  dataCenter="$JP/oauth/v2/token"
else
  dataCenter="$US/oauth/v2/token"
fi
# printf 'curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=refresh_token&refresh_token=${refreshToken}&client_id=${clientID}&client_secret=${clientSecret}" ${dataCenter}'
echo "refreshToken:${refreshToken}"
echo "clientID: ${clientID}"
echo "clientSecret:${clientSecret}"
echo "dataCenter:${dataCenter}"
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d "grant_type=refresh_token&refresh_token=${refreshToken}&client_id=${clientID}&client_secret=${clientSecret}" ${dataCenter} 
