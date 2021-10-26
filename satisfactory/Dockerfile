FROM steamcmd/steamcmd:ubuntu-20

LABEL maintainer="Lennart Weller <lhw@ring0.de>"

ENV HOME /data

ENV STEAM_APPID 1690800
ENV STEAM_APP SatisfactoryDedicatedServer
ENV STEAM_APPDIR ${HOME}/${STEAM_APP}

RUN useradd -m -d /data/ satisfactory
ADD entrypoint.sh /usr/local/bin/

USER satisfactory
WORKDIR ${HOME}
VOLUME ["/data"]
EXPOSE 15777/udp 15000/udp 7777/udp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
