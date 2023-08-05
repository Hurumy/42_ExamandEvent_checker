#!/bin/sh

EXAMINFOPATH=$(sh geteventinfo.sh exams)
RESPATH=$(sh countsubscribers.sh $EXAMINFOPATH)

echo $RESPATH
vi $RESPATH

