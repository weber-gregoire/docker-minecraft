FROM        alpine:3.6
MAINTAINER  Grégoire Weber

ENV         MINECRAFT_VERSION 1.13
ENV         MINECRAFT_SERVEUR_URL "https://launcher.mojang.com/mc/game/${MINECRAFT_VERSION}/server/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar"

VOLUME      /minecraft/data
WORKDIR     /minecraft
EXPOSE      25565

RUN         apk --no-cache --update add openjdk8-jre curl

RUN         curl ${MINECRAFT_SERVEUR_URL} -o ./minecraft_server.${MINECRAFT_VERSION}.jar && \
            chmod +x ./minecraft_server.${MINECRAFT_VERSION}.jar

COPY        ./startup.sh .

CMD         ["./startup.sh"]
