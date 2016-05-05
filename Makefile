all: test

TEST = docker run --rm -it -v $(CURDIR):/app \
	-v /var/run/docker.sock:/var/run/docker.sock mbodenhamer/docker-test

#-------------------------------------------------------------------------------

build:
	docker build -t mbodenhamer/emacs:latest .

shell:
	xhost +local:docker
	docker run --rm -it -v $(CURDIR):/files -v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY --entrypoint bash mbodenhamer/emacs

.PHONY: build shell
#-------------------------------------------------------------------------------

test-build:
	$(TEST) docker build -t mbodenhamer/emacs:bats .

quick-test:
	$(TEST) bats tests

test:
	$(MAKE) test-build
	$(MAKE) quick-test

.PHONY: test-build quick-test test
#-------------------------------------------------------------------------------
