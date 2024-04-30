#!/bin/bash
docker login -u $user -p $password
docker rm -f $(docker ps -aq)
docker image rm -f jaft/my-node:e
docker run -d -p 80:8080 --name nodejs jaft/my-node:e
