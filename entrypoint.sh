#!/bin/bash

result=`yellowlabtools $1`

GLOBALSCORE=`echo $result | jq -r '.scoreProfiles.generic.globalScore'`

echo "::set-output name=score::$GLOBALSCORE"

if [ $GLOBALSCORE -ge $2 ]; then
	exit 0
else
	exit 1
fi
