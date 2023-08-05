#!/bin/sh

#the first argment is just for dirname

DATE=$(date "+%s")
ORIGINFILEPATH=$1
ORIGINFILENAME=$(echo $ORIGINFILEPATH | awk -F/ '{ print $3 }')
ORIGINDIRNAME=$(echo $USERFILENAME | awk -F_ '{print $1}')
OUTDIRNAME=subscribers_info
OUTFILENAME=$OUTDIRNAME/$ORIGINDIRNAME/$ORIGINFILENAME

mkdir $OUTDIRNAME | true
cd $OUTDIRNAME
mkdir $ORIGINDIRNAME | true
cd ..
cat $ORIGINFILEPATH | grep -e "subsc" -e "begin_at" -e "end_at" -e "Rank" > $OUTFILENAME
echo $OUTFILENAME

