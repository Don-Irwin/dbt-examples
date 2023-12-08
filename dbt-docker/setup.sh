#!/bin/bash
cp .env.template .env
docker-compose up -d --build
docker-compose -f docker-compose-postgres.yml up -d --build
docker ps


echo "***********************************"
echo "*                                 *"
echo "* Waiting for PGAdmin to be ready *"
echo "*                                 *"
echo "***********************************"



finished=false
while ! $finished; do
    health_status=$(curl -o /dev/null -s -w "%{http_code}\n" -X GET "http://127.0.0.1:5050/login?next=%2F")
    if [ $health_status == "200" ]; then
        finished=true
        echo "*********************************"
        echo "*                               *"
        echo "*      Pgadmin is ready         *"
        echo "*                               *"
        echo "*********************************"
        google-chrome "http://127.0.0.1:5050" &        
    else
        finished=false
    fi
done


#open up bigquery

