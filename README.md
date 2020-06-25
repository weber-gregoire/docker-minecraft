![Travis](https://img.shields.io/travis/weber-gregoire/docker-minecraft.svg)![Docker Pulls](https://img.shields.io/docker/pulls/gregoireweber/minecraft-server.svg)


Ligthweight docker image to run a minecraft server with Docker


# Working example

Check the `example` folder for a full working example, with documentation.


# How to use

You can start a minecraft server simply by typing this command :
```
docker run -d -p 25565:${EXPOSED_PORT} -v ${PATH_TO_DATA_FOLDER}:/minecraft/data gregoireweber/minecraft-server:latest
```

Where

 * `${PATH_TO_DATA_FOLDER}` is the absolute path to the folder that will hold the server data (whitelist, bannedip, config, etc...)
 * `${EXPOSED_PORT}` is the port from wich you'll be able to reach the server (the default port for minecraft server is `25565`)

Once the container is running, you can connect to your serveur using the following address:
```
 127.0.0.1:${EXPOSED_PORT}
```


# Docker Tags

All images are pushed on [dockerhub][1] with `gregoireweber/minecraft-server` name.
Image tags follow the minecraft server versions.

 * `latest` tag will give you the latest stable image
 * using major version will give you the latest major version of minecraft server (ex: `1.16`)
 * using minor version will give you the latest image built with that server version (ex: `1.16.1`)
 * usign minor version dash build number will always give you the same image (ex: `1.16.1-7`)

The full tag list can be [found here][2]


## Troubleshooting

If ypu try to start the container on a  Linux Alpine machine, you might have a memory allocation error on container startup.
To fix that, run the following on your host:
```
sysctl -w kernel.pax.softmode=1
```

# External Ressources

Forked from https://github.com/overshard/docker-minecraft
See [original readme][3] for more information.

[Minecraft officiel website][4].
[Docker documentation][5].

[0]: https://travis-ci.org/weber-gregoire/docker-minecraft
[1]: https://hub.docker.com/r/gregoireweber/minecraft-server/
[2]: https://hub.docker.com/r/gregoireweber/minecraft-server/tags/
[3]: https://github.com/overshard/docker-minecraft
[4]: http://minecraft.net/
[5]: https://docs.docker.com/
