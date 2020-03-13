#!/bin/bash

SHARED_SECRET=$1
USER_NAME=$2
CODE=$3
ENDPOINT=$4

if [ -z $ENDPOINT ]
then
    ENDPOINT='10.0.0.8'
fi

if [ $ENDPOINT = 'CAS' ]
then
    ENDPOINT='10.0.0.8'
fi

if [ $ENDPOINT = 'AM' ]
then
    ENDPOINT='10.0.0.21'
fi

radtest "$USER_NAME" "$CODE" "$ENDPOINT" 0 "$SHARED_SECRET"