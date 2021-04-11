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


id:
	@docker image ls $(ORG)/$(PROJ):latest | tail -1 | awk '{print $$3}'


$(OUT_DIR)/Manual.txt:
	@mkdir -p $(OUT_DIR)
	export ID=$(shell $(MAKE) id); docker cp $$ID:/Manual.txt $(OUT_DIR)/Manual.txt

help: $(OUT_DIR)/Manual.txt
	cat $(OUT_DIR)/Manual.txt

