[![ioquake3.org](https://ioquake3.org/wp/wp-content/themes/ioq3-deboy/ioq3.png)](https://ioquake3.org/)
[![OSP Tourney Q3A](http://www.orangesmoothie.org/graphix/oslogo.gif)](http://www.orangesmoothie.org/tourneyQ3A/)

# ioQuake3 (with OSP Tourney) server in docker

## Building

* Copy `pak0.pk3` from original game distribution to the `baseq3` directory
* Run `docker build -t q3-server .`

## Running
* Run `docker run -p 27960:27960/udp q3-server`

## Deploying via ansible
* By default it will search for `pak0.pk3` file in `./baseq3/` directory
* Add servers to q3-servers group in ansible inventory file
* Run `ansible-playbook provision.yml`
