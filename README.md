# IOQuake3 server in docker

## Building

* Copy pak0.pk3 to baseq3 directory
* Run `docker build -t q3-server .`

## Running
* Run `docker run --net=host q3-server`
