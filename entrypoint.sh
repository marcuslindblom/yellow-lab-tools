#!/bin/bash

HOST=${3:-"https://yellowlab.tools/api/runs"}
SCORE=${2:-100}
URL=$1

GLOBALSCORE=`curl -sS -L -H 'Content-Type: application/json' \
--data '{ 
"url": "'$URL'",
"waitForResponse": true
}' $HOST | jq -r '.scoreProfiles.generic.globalScore'`

echo "::set-output name=score::$GLOBALSCORE"

if [ $GLOBALSCORE -ge $SCORE ]; then
	exit 0
else
	exit 1
fi
