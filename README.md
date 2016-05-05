[![](https://travis-ci.org/mbodenhamer/docker-emacs.svg?branch=master)](https://travis-ci.org/mbodenhamer/docker-emacs)

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


Tags
----

### `onbuild`

`mbodenhamer/emacs:onbuild` uses `ONBUILD` instructions to enable a custom Emacs setup. The build arguments are as follows:

* `provision`: Path to a script that will run arbitrary provisioning actions. Defaults to `provision.sh`.
* `packages`: Path to an elisp script that will perform package installation / configuration actions. Defaults to `packages.el`.
* `conf`: Path to a file that will be copied to `~/.emacs` in the container. Defaults to `.emacs`.
* `uid`: UID of the user to use Emacs as. Defaults to 1000.
* `gid`: GID of the user to use Emacs as. Defaults to 1000.


[`mbodenhamer/emacs-elpy`](https://hub.docker.com/r/mbodenhamer/emacs-elpy/) is an example of a Docker application that uses these onbuild features to install [Elpy](https://github.com/jorgenschaefer/elpy).
