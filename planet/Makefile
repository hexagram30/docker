ORG=hexagram30
PROJ = planet
DOCKER_DIR = ./
PLANET_VERSION = 2021.03.15
OUT_DIR = ./output

image:
	@docker build -t $(ORG)/$(PROJ) $(DOCKER_DIR)
	@docker tag $(ORG)/$(PROJ) $(ORG)/$(PROJ):latest
	@docker tag $(ORG)/$(PROJ) $(ORG)/$(PROJ):$(PLANET_VERSION)

publish:
	@docker push $(ORG)/$(PROJ):latest
	@docker push $(ORG)/$(PROJ):$(PLANET_VERSION)

help:
	@docker run -t --entrypoint=/cat $(ORG)/$(PROJ):latest /Manual.txt|more
