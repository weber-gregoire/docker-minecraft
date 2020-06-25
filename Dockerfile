FROM        openjdk:11.0.5-jre-stretch
MAINTAINER  Grégoire Weber

ENV         MINECRAFT_VERSION 1.16.1
ENV         MINECRAFT_SERVEUR_URL "https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar"

VOLUME      /minecraft/data
WORKDIR     /minecraft
EXPOSE      25565

RUN         apt-get install -y curl

RUN         curl ${MINECRAFT_SERVEUR_URL} -o ./minecraft_server.${MINECRAFT_VERSION}.jar && \
            chmod +x ./minecraft_server.${MINECRAFT_VERSION}.jar

COPY        ./startup.sh .

CMD         ["./startup.sh"]
