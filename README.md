# ioQuake3 (with OSP Tourney) server in docker

## Building

* Copy `pak0.pk3` from original game distribution to the `baseq3` directory
* Run `docker build -t q3-server .`

## Running
* Run `docker run -p 27960:27960/udp q3-server`
