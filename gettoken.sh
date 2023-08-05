#!/bin/sh

#first argment is your uid, the second one is your secret
mkdir tokeninfo | true
curl -X POST --data "grant_type=client_credentials&client_id=$1&client_secret=$2" https://api.intra.42.fr/oauth/token | tr ',' '\n' | cat > tokeninfo/token.json

