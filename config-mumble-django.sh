#!/bin/bash

CONTAINER_NAME=mumble-django

docker exec -it $CONTAINER_NAME /bin/bash -c "python /opt/mumble-django/pyweb/manage.py syncdb"
