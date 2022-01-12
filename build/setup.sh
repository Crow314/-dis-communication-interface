#!/bin/bash

project_name='dis-communication-interface'

cd "$(dirname $0)/../"

touch ./build/secrets.env

docker-compose -f build/development/docker-compose.yml -p "$project_name-development" build

docker-compose -f build/development/docker-compose.yml -p "$project_name-development" run --rm rails bundle install
docker-compose -f build/development/docker-compose.yml -p "$project_name-development" run --rm rails bundle exec rake db:create ridgepole:apply db:seed db:seed_fu
