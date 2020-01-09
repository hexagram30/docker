# hexagram30/docker

*Dockerfiles for hexagram30 projects*

[![][logo]][logo-large]


This repo manages the folling Docker images:

* [hexagram30/noise](https://hub.docker.com/r/hexagram30/noise)
	```
	$ docker run \
		-v `pwd`/example-images:/example_images \
		hexagram30/noise
	```
* [hexagram30/planet](https://hub.docker.com/r/hexagram30/planet)
	```
	$ docker run hexagram30/planet -?
	$ docker run hexagram30/planet \
  		-w 1600 -h 1200 -pm -b -E -C Altitude.col >
		planet-001-mercator-b.bmp
	```
* [hexagram30/redis-graph](https://hub.docker.com/r/hexagram30/redis-graph)
* [hexagram30/redixdb](https://hub.docker.com/r/hexagram30/redixdb)

## License

Copyright © 2018-2020, Hexagram30

Apache License, Version 2.0


<!-- Named page links below: /-->

[logo]: https://raw.githubusercontent.com/hexagram30/resources/master/branding/logo/h30-logo-2-long-with-text-x695.png
[logo-large]: https://raw.githubusercontent.com/hexagram30/resources/master/branding/logo/h30-logo-2-long-with-text-x3440.png
