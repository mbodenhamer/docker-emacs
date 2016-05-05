[![](https://travis-ci.org/mbodenhamer/docker-emacs.svg?branch=onbuild)](https://travis-ci.org/mbodenhamer/docker-emacs)

Emacs in Docker.

Usage
-----

You will probably need to run the following to get the GUI to work:

    $ xhost +local:docker
    non-network local connections being added to access control list


After that, the container can be started like any other Docker GUI app:

    $ docker run --rm -v $(pwd):/files -v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY mbodenhamer/emacs [ARGS]


Emacs can also be started in console mode:

    $ docker run --rm -it -v $(pwd):/files mbodenhamer/emacs [ARGS]


Whatever directory you want emacs to access should be mapped to the `/files` volume.


mbodenhamer/emacs:onbuild
-------------------------

This image uses `ONBUILD` instructions to build a custom Emacs setup. The build arguments are as follows:

* `provision`: Path to a script that will run arbitrary provisioning actions. If not supplied as a `--build-arg`, will default to `provision.sh`.
* `packages`: Path to an elisp script that will perform package installation / configuration actions. If not supplied as a `--build-arg`, will default to `packages.el`.
* `conf`: Path to a file that will be copied to `~/.emacs` in the container. If not supplied as a `--build-arg`, will default to `.emacs`.
* `uid`: UID of the user to use Emacs as. If not supplied as a `--build-arg`, will default to 1000.
* `gid`: GID of the user to use Emacs as. If not supplied as a `--build-arg`, will default to 1000.


An example Docker application using these onbuild features to install [Elpy](https://github.com/jorgenschaefer/elpy) can be found in [`tests/elpy/`](https://github.com/mbodenhamer/docker-emacs/tree/onbuild/tests/elpy).
