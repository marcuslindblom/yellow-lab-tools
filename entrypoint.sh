#!/bin/sh

HOST=${3:-'https://yellowlab.tools/api/runs'}

GLOBALSCORE=`curl -s -L -H 'Content-Type: application/json' \
--data '{ 
"url": "'$1'",
"waitForResponse": true
}' $HOST | jq -r '.scoreProfiles.generic.globalScore'`

echo "::set-output name=score::$GLOBALSCORE"

if [ $GLOBALSCORE -ge $2 ]; then
	exit 0
else
	exit 1
fi
