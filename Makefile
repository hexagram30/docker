ORG=hexagram30

#############################################################################
###   Kafka   ###############################################################
#############################################################################

kafka-image: PROJ=kafka
kafka-image: VERS=2.12-1.0.1
kafka-image:
	docker build -t $(ORG)/$(PROJ):$(VERS) ./kafka

#############################################################################
###   Redis Builder   #######################################################
#############################################################################

redis-builder-dockerfile: VERS=4.0.8
redis-builder-dockerfile:
	cat ./redis-graph/builder/Dockerfile.in | \
	sed -e 's/{{VERSION}}/$(VERS)/g' > \
	./redis-graph/builder/Dockerfile

redis-builder: PROJ=redis-graph-builder
redis-builder: VERS=4.0.8
redis-builder: redis-builder-dockerfile
	docker build \
		-t $(ORG)/$(PROJ):$(VERS) \
		redis-graph/builder

redis-builder-run: PROJ=redis-graph-builder
redis-builder-run: VERS=4.0.8
redis-builder-run:
	-@redis-builder-stop
	rm -rf /tmp/docker-redis-builder-container-id
	docker run \
		-d \
		-p 50999:50999 \
		--cidfile=/tmp/docker-redis-builder-container-id \
		$(ORG)/$(PROJ):$(VERS)

redis-builder-stop:
	docker stop \
		`cat /tmp/docker-redis-builder-container-id`

redis-builder-bash: PROJ=redis-graph-builder
redis-builder-bash: VERS=4.0.8
redis-builder-bash:
	docker run \
		-it \
		$(ORG)/$(PROJ):$(VERS) \
		bash

redis-builder-copy: redis-builder redis-builder-run
	nc localhost 50999 > redis-graph/redisgraph.so
	$(MAKE) redis-builder-stop

#############################################################################
###   Redis Graph   #########################################################
#############################################################################

redis-graph-dockerfile: VERS=4.0.8
redis-graph-dockerfile:
	cat ./redis-graph/Dockerfile.in | \
	sed -e 's/{{VERSION}}/$(VERS)/g' > \
	./redis-graph/Dockerfile

redis-graph: PROJ=redis-graph
redis-graph: VERS=4.0.8
redis-graph: redis-graph-dockerfile
	docker build \
		-t $(ORG)/$(PROJ):$(VERS) \
		redis-graph

redis-graph-run: PROJ=redis-graph
redis-graph-run: VERS=4.0.8
redis-graph-run:
	-@redis-graph-stop
	rm -rf /tmp/docker-redis-graph-container-id
	docker run \
		-it \
		-p 6379:6379 \
		-v ./data:/data \
		--cidfile=/tmp/docker-redis-graph-container-id \
		$(ORG)/$(PROJ):$(VERS)

redis-graph-stop: PROJ=redis-graph
redis-graph-stop: VERS=4.0.8
redis-graph-stop:
	docker stop \
		`cat /tmp/docker-redis-graph-container-id`

redis-graph-publish: PROJ=redis-graph
redis-graph-publish: VERS=4.0.8
redis-graph-publish:
	docker push $(ORG)/$(PROJ):$(VERS)

#############################################################################
###   Redix   ###############################################################
#############################################################################

DOCKER_DIR = build/docker
REDIX_VERSION = 1.10

redix-image:
	@docker build -t $(ORG)/redixdb redixdb
	@docker tag $(ORG)/redixdb $(ORG)/redixdb:latest
	@docker tag $(ORG)/redixdb $(ORG)/redixdb:$(REDIX_VERSION)

redix-publish:
	@docker push $(ORG)/redixdb:latest
	@docker push $(ORG)/redixdb:$(REDIX_VERSION)

redix-run:
	@docker run -it \
		-p 7090:7090 -p 6380:6380 \
		-v `pwd`/data/redixdb:/data \
		$(ORG)/redixdb:latest \
		-engine boltdb \
		-storage /data \
		-verbose

#############################################################################
###   Miscellaneous   #######################################################
#############################################################################

.PHONY: redis-graph
