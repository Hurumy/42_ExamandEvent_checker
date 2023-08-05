#!/bin/sh

#FOR 42TOKYO: campus_id=26
#first argment is the dirname(exams or events)

DATE=$(date)
TIMESTAMP=$(date "+%s")
ACCESS_TOKEN=$(cat tokeninfo/token.json | tr '{' ' ' | grep "access_token" | awk -F: '{ print $2 }' | sed "s/\"//g")
DIRNAME=$1info
FILEPATH=$DIRNAME/$1/$1_$TIMESTAMP.json

mkdir $DIRNAME | true
cd $DIRNAME
mkdir $1 | true
cd ..
echo $DATE >> $FILEPATH
echo '\n' >> $FILEPATH
curl -X GET -H "Authorization: Bearer $ACCESS_TOKEN" https://api.intra.42.fr/v2/campus/26/$1 | tr ',' '\n' >> $FILEPATH
echo $FILEPATH

