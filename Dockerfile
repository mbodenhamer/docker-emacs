FROM debian:jessie
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

RUN apt-get clean && apt-get update && apt-get install -y \
    emacs \
    && rm -rf /var/lib/apt/lists/* \
    && touch /root/.emacs \
    && mkdir /root/.emacs.d

VOLUME ["/files"]
WORKDIR /files
ENTRYPOINT ["emacs"]
