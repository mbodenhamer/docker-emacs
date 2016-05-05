FROM debian:jessie
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

RUN apt-get clean && apt-get update && apt-get install -y \
    emacs \
    sudo \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i "s/root\sALL=(ALL:ALL) ALL/ALL    ALL = (ALL) NOPASSWD: ALL/" /etc/sudoers \
    && touch /root/.emacs \
    && mkdir /root/.emacs.d

VOLUME ["/files"]
WORKDIR /files
ENTRYPOINT ["emacs"]
