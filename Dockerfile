FROM        openjdk:11.0.5-jre-stretch
MAINTAINER  Grégoire Weber

ENV         MINECRAFT_VERSION 1.15.1
ENV         MINECRAFT_SERVEUR_URL "https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar"

VOLUME      /minecraft/data
WORKDIR     /minecraft
EXPOSE      25565

RUN         apt-get install -y curl

RUN         curl ${MINECRAFT_SERVEUR_URL} -o ./minecraft_server.${MINECRAFT_VERSION}.jar && \
            chmod +x ./minecraft_server.${MINECRAFT_VERSION}.jar

COPY        ./startup.sh .

CMD         ["./startup.sh"]
