#!/bin/bash

docker-compose down 
docker-compose -f docker-compose-postgres.yml down 
docker ps
