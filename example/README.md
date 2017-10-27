# Launch creative and survival servers in one command

You can use this example as-is to start two Minecraft servers.
One in survival mode, and the other in creative mode.

To do so, you just have to follow two steps:

## 1 - Set the whitelist

Update the content of both `whitelist.json` files, in `survival` and `creative` folders.
Replace the placehoders with your username et UUID, and add as many players as you want.
If you don't know your UUID, you can find it [here][0].

## 2 - Start the containers

Just run the following command in the current directory :
```
docker-compose up -d
```

Once the containers will be started, you'll be able to join both servers using :

 * `120.0.0.1:25565` for the survival mode server
 * `120.0.0.1:25566` for the creative mode server

I assume here that you run the containers on your own computer, replace `127.0.0.1` by you serveur IP otherwise.


# Details

The `docker-compose.yml` file define two services based on the minecraft server docker image.
In both `survival` and `creative` folder is a `server.properies` that set the game mode for each of the services that will start.

The `whitelist.json` files will be read when the containers will start.

The `volumes:` instruction in `docker-compose.yml` file indicate that all data (world and player information) will be stored in the `survival` and `creative` folders.
If you want to back-up your data and/or config, or move your server, just create an archive of those two folders.

# Have fun :)

[0]: https://mcuuid.net/