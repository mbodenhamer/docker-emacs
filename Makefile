all: test

TEST = docker run --rm -it -v $(CURDIR):/app \
	-v /var/run/docker.sock:/var/run/docker.sock mbodenhamer/docker-test

#-------------------------------------------------------------------------------

build:
	$(TEST) docker build -t mbodenhamer/emacs:onbuild .

shell:
	xhost +local:docker
	docker run --rm -it -v $(CURDIR):/files -v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY --entrypoint bash mbodenhamer/emacs

.PHONY: build shell
#-------------------------------------------------------------------------------

quick-test:
	$(TEST) bats tests

test:
	$(MAKE) build
	$(MAKE) quick-test

.PHONY: quick-test test
#-------------------------------------------------------------------------------
