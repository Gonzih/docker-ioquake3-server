# IOQuake3 server in docker

## Building

* Copy pak0.pk3 to baseq3 directory
* Run `docker build -t q3-server .`

## Running
* Run `docker run -p 27960:27960/udp q3-server`
