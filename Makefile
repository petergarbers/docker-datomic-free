NS = atyz
VERSION ?= latest

REPO = datomic-free
NAME = datomic-free
INSTANCE = default
PORTS = -p 4334:4334 -p 4335:4335 -p 4336:4336
ENV = \
  -e ABC=DEF

.PHONY: build push shell test run start stop rm release

build:
	docker build -t $(NS)/$(REPO):$(VERSION) .

push:
	docker push $(NS)/$(REPO):$(VERSION)

fast_track:
	../docker/fast_track $(NS)/$(REPO) $(VERSION)

shell:
	docker run --rm --name $(NAME)-$(INSTANCE) -i -t $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION) /bin/bash

test:
	docker run --rm $(NS)/$(REPO):$(VERSION) yarn test

run:
	docker run --rm --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

start:
	docker run -d --name $(NAME)-$(INSTANCE) $(PORTS) $(VOLUMES) $(ENV) $(NS)/$(REPO):$(VERSION)

stop:
	docker stop $(NAME)-$(INSTANCE)

rm:
	docker rm $(NAME)-$(INSTANCE)

release: build
	make push -e VERSION=$(VERSION)

default: build
