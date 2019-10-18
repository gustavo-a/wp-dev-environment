#!/bin/bash

export $(egrep -v '^#' .env | xargs)

if [ "`grep -c $PROJECT_NAME /etc/hosts`" -gt "0" ]
then
  echo "$PROJECT_NAME already exists in /etc/hosts"
else
  printf "127.0.0.1\t$PROJECT_NAME.local\n" >> /etc/hosts
  printf "127.0.0.1\tphpmyadmin.$PROJECT_NAME.local" >> /etc/hosts
  echo "$PROJECT_NAME successfully added to hosts"
fi

exit 0
