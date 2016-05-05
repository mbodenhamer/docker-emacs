all: test

TEST = docker run --rm -it -v $(CURDIR):/app \
	-v /var/run/docker.sock:/var/run/docker.sock \
	mbodenhamer/docker-test:1.9.1

#-------------------------------------------------------------------------------

build:
	docker build -t mbodenhamer/emacs:latest .

shell:
	xhost +local:docker
	docker run --rm -it -v $(CURDIR):/files \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY --entrypoint bash mbodenhamer/emacs:latest

.PHONY: build shell
#-------------------------------------------------------------------------------

quick-test:
	$(TEST) bats tests

test:
	$(MAKE) build
	$(MAKE) quick-test

.PHONY: quick-test test
#-------------------------------------------------------------------------------
