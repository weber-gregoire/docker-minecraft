![Build Status](https://travis-ci.org/weber-gregoire/docker-minecraft.svg?branch=master)

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

All images are pushed on [dockerhub][0] with `gregoireweber/minecraft-server` name.
Image tags follow the minecraft server versions.

 * `latest` tag will give you the latest stable image
 * using major version will give you the latest major version of minecraft server (ex: `1.12`)
 * using minor version will give you the latest image built with that server version (ex: `1.12.2`)
 * usign minor version dash build number will always giveyou the same image (ex: `1.12.2-7`)

The full tag list can be [found here][1]


# External Ressources

Forked from https://github.com/overshard/docker-minecraft
See [original readme][2] for more information.

[Minecraft officiel website][3].
[Docker documentation][4].

[0]: https://hub.docker.com/r/gregoireweber/minecraft-server/
[1]: https://hub.docker.com/r/gregoireweber/minecraft-server/tags/
[2]: https://github.com/overshard/docker-minecraft
[3]: http://minecraft.net/
[4]: https://docs.docker.com/
