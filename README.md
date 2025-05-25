# podmania

## install podman

* Ubuntu 20.10 and newer:
* sudo apt-get update
* sudo apt-get -y install podman
* test: podman run --name basic_httpd -dt -p 8080:80/tcp docker.io/nginx -> podman ps -> podman stop .. -> podman rm ..

## install podman-compose

* sudo apt install pipx
* pipx install podman-compose
* podman-compose version

## setting up a non-root user
* sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER

## run podman
* podman-compose up -d
* podman-compose down

* use yml files in this repo

## why podman?
* beause docker wants to be runned as sudo

## sources
* https://podman.io/
* https://betterstack.com/community/guides/scaling-docker/podman-compose/#working-with-volumes-networks-and-logs
