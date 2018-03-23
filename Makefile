redis-builder:
	docker build \
		-t hexagram30/redis-graph-builder:4.0.8 \
		redis-graph/builder

redis-builder-run:
	-@redis-builder-stop
	rm -rf /tmp/docker-redis-builder-container-id
	docker run \
		-d \
		-p 50999:50999 \
		--cidfile=/tmp/docker-redis-builder-container-id \
		hexagram30/redis-graph-builder:4.0.8

redis-builder-stop:
	docker stop \
		`cat /tmp/docker-redis-builder-container-id`

redis-builder-bash:
	docker run \
		-it \
		hexagram30/redis-graph-builder:4.0.8 \
		bash

redis-builder-copy: redis-builder redis-builder-run
	nc localhost 50999 > redis-graph/redisgraph.so
	$(MAKE) redis-builder-stop

redis-graph:
	docker build \
		-t hexagram30/redis-graph:4.0.8 \
		redis-graph

redis-graph-run:
	-@redis-graph-stop
	rm -rf /tmp/docker-redis-graph-container-id
	docker run \
		-it \
		-p 6379:6379 \
		--cidfile=/tmp/docker-redis-graph-container-id \
		hexagram30/redis-graph:4.0.8

redis-graph-stop:
	docker stop \
		`cat /tmp/docker-redis-graph-container-id`

redis-graph-publish:
	docker push hexagram30/redis-graph:4.0.8

.PHONY: redis-graph
