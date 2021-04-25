#!/bin/bash

SCORE=${2:-100}
URL=$1

RUNID=$(curl -L -X POST -H 'Content-Type: application/json' \
--data-raw '{
	"url": "'$URL'",
	"waitForResponse": false
}' $HOST | jq -r '.runId')

check() {
	STATUS=$(curl -L -X GET 'https://yellowlab.tools/api/runs/'$RUNID'' | jq -r '.status.statusCode')
}

check #1st execution

#echo $STATUS
while [ "$STATUS" == "running" ]; do
	sleep 5
	check
done

GLOBALSCORE=$(curl -L -H 'Content-Type: application/json' 'https://yellowlab.tools/api/results/'$RUNID'' | jq -r '.scoreProfiles.generic.globalScore')

echo "::set-output name=score::$GLOBALSCORE"

if [ $GLOBALSCORE -ge $SCORE ]; then
	exit 0
else
	exit 1
fi
