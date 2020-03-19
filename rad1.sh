#!/bin/bash
USERNAME=$1
CODE=$2
ENDOINT=$3
NEXT_CODE=$4
STATE=$5

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

if [ -z $NEXT_CODE ]
then
    printf "User-Name = $USERNAME\nUser-Password = $CODE" | radclient -x $ENDPOINT auth yubico
elif [ ! -z $NEXT_CODE ]
then
    printf "User-Name = $USERNAME\nUser-Password = $NEXT_CODE\nState=$STATE\n" | radclient -x $ENDPOINT auth yubico
fi
