FROM debian:stretch-slim

RUN apt-get update 
RUN apt install -y mercurial patch

WORKDIR /opt
RUN hg clone https://bitbucket.org/Svedrin/mumble-django

COPY IceEncodingVersion.patch /opt/mumble-django
WORKDIR /opt/mumble-django
RUN patch -p1 < IceEncodingVersion.patch

RUN mkdir -p /opt/mumble/ice

RUN apt-get install -y python-pil python-pip

# Install older version of django
RUN pip install django==1.7

# Install zeroc-ice
RUN apt-get install -y libssl-dev libbz2-dev
RUN pip install zeroc-ice

# mumble-django is looking for Murmur.ice in /usr/share/slice
# our share volume will mount it at /opt/mumble/ice/Murmur.ice
# link it to the correct place
RUN mkdir -p /usr/share/slice
RUN ln -s /opt/mumble/ice/Murmur.ice /usr/share/slice/Murmur.ice

VOLUME ["/opt/mumble-django/db"]

EXPOSE 9000/tcp

CMD [ "python", "/opt/mumble-django/pyweb/manage.py", "runserver", "0.0.0.0:9000" ]
