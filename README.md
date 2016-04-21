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
