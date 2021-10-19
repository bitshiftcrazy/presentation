FROM node
MAINTAINER bitshiftcrazy <bitshiftcrazy@posteo.de>

RUN apt-get update && apt-get install -y git
RUN npm install -g forever

RUN git clone https://github.com/yaronn/wopr.git
WORKDIR /wopr
RUN npm install

EXPOSE 80
ENV PORT 80

ENV LANG=en_US.utf8
ENV TERM=xterm-256color

COPY data /data
COPY bin/ /src/bin/

RUN chmod 755 /src/bin/wopr

WORKDIR /wopr/server
CMD /src/bin/wopr