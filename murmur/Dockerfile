FROM debian:buster-slim

ARG VERSION="1.3.2"

RUN apt-get update
RUN apt-get install -y wget bzip2

WORKDIR /tmp
RUN wget https://dl.mumble.info/stable/murmur-static_x86-${VERSION}.tar.bz2

RUN mkdir -p /opt/mumble/cfg
RUN tar xjf /tmp/murmur-static_x86-${VERSION}.tar.bz2 --strip-components=1 -C /opt/mumble

RUN adduser --disabled-password --no-create-home --gecos '' murmur
RUN chown -R murmur:murmur /opt/mumble
RUN mv /opt/mumble/murmur.ini /opt/mumble/murmur-default.ini

WORKDIR /opt/mumble

EXPOSE 64738/tcp 64738/udp 6502/tcp

VOLUME ["/opt/mumble/ice", "/opt/mumble/cfg"]

USER murmur
CMD ["/opt/mumble/murmur.x86", "-fg", "-ini", "/opt/mumble/cfg/murmur.ini"]
