# mumble-server
Docker-compose setup for mumble server including web frontend &amp; admin page
Using [mumble-web](https://github.com/Johni0702/mumble-web) as web frontend and [mumble-django](https://bitbucket.org/Svedrin/mumble-django) as admin backend

# Install
First clone the repo
```
git clone https://github.com/Raddinox/mumble-server.git
```

## Default configuration
Create default config, you may want to edit the default settings.
```
mkdir -p /srv/mumble/mumble-web
cp mumble-web/config.local.js /srv/mumble/mumble-web/
mkdir -p /srv/mumble/murmur
cp murmur/murmur-default.ini /srv/mumble/murmur/murmur.ini
```
If you have changed paths for the config files you need to make the changes to the `docker-compose.yml` file, so the services can find the configuration files.


## Run
```
docker-compose up -d
```

When all services are up you will need to run `./config-mumble-django.sh` to set the admin password for mumble-django admin page.

Note: If you change container names in `docker-compose.yml` you need to change the name in `config-mumble-django.sh` too.
