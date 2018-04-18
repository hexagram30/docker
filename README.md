# hexagram30/docker

*Dockerfiles for hexagram30 projects*

[![][logo]][logo-large]


## Usage


### Kafka

Create image:
```
$ make kafka-image
```

Run container:
```
docker run \
	-p 2181:2181 \
	-p 9092:9092 \
	--env ADVERTISED_HOST=`docker-machine ip \`docker-machine active\`` \
	--env ADVERTISED_PORT=9092 \
	hexagram30/kafka:2.12-1.0.1
```


## License

Copyright © 2018, Hexagram30

Apache License, Version 2.0


<!-- Named page links below: /-->

[logo]: https://raw.githubusercontent.com/hexagram30/resources/master/branding/logo/h30-logo-2-long-with-text-x695.png
[logo-large]: https://raw.githubusercontent.com/hexagram30/resources/master/branding/logo/h30-logo-2-long-with-text-x3440.png
