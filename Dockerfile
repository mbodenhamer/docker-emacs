FROM debian:jessie
MAINTAINER Matt Bodenhamer <mbodenhamer@mbodenhamer.com>

RUN apt-get update && apt-get install -y \
    emacs \
    && rm -rf /var/lib/apt/lists/*

VOLUME ["/files"]
WORKDIR /files
ENTRYPOINT ["emacs"]
