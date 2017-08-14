FROM        ubuntu:14.04
MAINTAINER  Grégoire Weber

ENV         DEBIAN_FRONTEND noninteractive
ENV         MINECRAFT_VERSION 1.12
ENV         MINECRAFT_SERVEUR_URL "https://s3.amazonaws.com/Minecraft.Download/versions/${MINECRAFT_VERSION}/minecraft_server.${MINECRAFT_VERSION}.jar"

VOLUME      /minecraft/data
EXPOSE      25565

RUN         apt-get --yes update; apt-get --yes upgrade; apt-get --yes install software-properties-common && \
            sudo apt-add-repository --yes ppa:webupd8team/java; apt-get --yes update && \
            echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
            echo debconf shared/accepted-oracle-license-v1-1 seen true | debconf-set-selections && \
            apt-get --yes install curl oracle-java8-installer ; apt-get clean

WORKDIR     /minecraft

RUN         curl ${MINECRAFT_SERVEUR_URL} -o ./minecraft_server.${MINECRAFT_VERSION}.jar && \
            chmod +x ./minecraft_server.${MINECRAFT_VERSION}.jar

WORKDIR     /minecraft/data

CMD         cp ../minecraft_server.${MINECRAFT_VERSION}.jar . && \
            echo "eula=true" > ./eula.txt && \
            java -Xmx2G -jar minecraft_server.${MINECRAFT_VERSION}.jar nogui
