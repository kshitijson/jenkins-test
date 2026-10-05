#!/bin/sh
# Stops and removes the containers started by start.sh.
# Volumes (jenkins-data, jenkins-docker-certs), images and the jenkins network are kept.

# Agent containers spawned by the Jenkins Docker cloud
for image in myjenkinsagents:python devopsjourney1/myjenkinsagents:python; do
  ids=$(docker ps -aq --filter "ancestor=$image")
  [ -n "$ids" ] && docker rm -f $ids
done

docker rm -f jenkins-blueocean socat 2>/dev/null

echo "Stopped. Volumes kept:"
docker volume ls --filter name=jenkins
