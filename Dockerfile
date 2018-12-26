FROM        alpine:3.6
MAINTAINER  Grégoire Weber

ENV         MINECRAFT_VERSION 1.13.2
ENV         MINECRAFT_SERVEUR_URL "https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar"

VOLUME      /minecraft/data
WORKDIR     /minecraft
EXPOSE      25565

RUN         apk --no-cache --update add openjdk8-jre curl

RUN         curl ${MINECRAFT_SERVEUR_URL} -o ./minecraft_server.${MINECRAFT_VERSION}.jar && \
            chmod +x ./minecraft_server.${MINECRAFT_VERSION}.jar

COPY        ./startup.sh .

CMD         ["./startup.sh"]
