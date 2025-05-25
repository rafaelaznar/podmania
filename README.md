# podmania

## install podman
* sudo apt install pipx
* pipx install podman-compose
* podman-compose version

## Setting up a non-root user
* sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER

## run podman
podman-compose up -d
podman-compose down

* use yml files in this repo

## why podman
* beause docker wants to be runned as sudo

## sources
* https://podman.io/
* https://betterstack.com/community/guides/scaling-docker/podman-compose/#working-with-volumes-networks-and-logs
