all: test

TEST = docker run --rm -it -v $(CURDIR):/app \
	-v /var/run/docker.sock:/var/run/docker.sock mbodenhamer/docker-test

#-------------------------------------------------------------------------------

shell:
	xhost +local:docker
	docker run --rm -it -v $(CURDIR):/files -v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY --entrypoint bash mbodenhamer/emacs

.PHONY: shell
#-------------------------------------------------------------------------------

build:
	$(TEST) docker build -t mbodenhamer/emacs:bats-onbuild .

quick-test:
	$(TEST) bats tests

test:
	$(MAKE) build
	$(MAKE) quick-test

.PHONY: build quick-test test
#-------------------------------------------------------------------------------
