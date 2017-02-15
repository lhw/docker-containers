FROM debian:jessie
MAINTAINER Lennart Weller <lhw@ring0.de>

ENV TS3_VERSION 3.0.19.4
ENV SINUS_VERSION 0.9.8

RUN apt-get update && \
		apt-get install -y xinit xvfb libxcursor1 ca-certificates bzip2 curl libglib2.0-0 python libav-tools && \
		rm -r /var/lib/apt/lists/*

WORKDIR /opt/

COPY sinusbot-${SINUS_VERSION}.tar.bz2 /tmp/
COPY TeamSpeak3-Client-linux_amd64-${TS3_VERSION}.run /tmp/
RUN chmod +x /tmp/TeamSpeak3-Client-linux_amd64-${TS3_VERSION}.run

RUN adduser --home /opt/ts3soundboard --disabled-login bot
RUN chown bot:bot /tmp/*

USER bot
WORKDIR /opt/ts3soundboard
RUN tar xf /tmp/sinusbot-${SINUS_VERSION}.tar.bz2 && \
		mv config.ini.dist config.ini

RUN yes | /tmp/TeamSpeak3-Client-linux_amd64-${TS3_VERSION}.run
RUN cp plugin/libsoundbot_plugin.so /opt/ts3soundboard/TeamSpeak3-Client-linux_amd64/plugins
RUN echo 'YoutubeDLPath = "/opt/ts3soundboard/data/youtube-dl"' >> /opt/ts3soundboard/config.ini
RUN ./ts3bot -update
RUN rm -f /tmp/*

CMD ["xinit", "/opt/ts3soundboard/ts3bot", "--", "/usr/bin/Xvfb", ":1", "-screen", "0", "800x600x16", "-ac"]
EXPOSE 8087
VOLUME ["/opt/ts3soundboard/data"]
