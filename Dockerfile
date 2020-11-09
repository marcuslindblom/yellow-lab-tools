# 1: Use node 6 as base:
FROM node:alpine3.12

RUN apk add --update --no-cache curl jq &&\
  cd /tmp && curl -Ls https://github.com/dustinblackman/phantomized/releases/download/2.1.1/dockerized-phantomjs.tar.gz | tar xz &&\
  cp -R lib lib64 / &&\
  cp -R usr/lib/x86_64-linux-gnu /usr/lib &&\
  cp -R usr/share/fonts /usr/share &&\
  cp -R etc/fonts /etc &&\
  curl -k -Ls https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 | tar -jxf - &&\
  cp phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs &&\
  rm -rf /tmp/*

RUN npm install -g yellowlabtools

# Copies your code file from your action repository to the filesystem path `/` of the container
COPY entrypoint.sh /entrypoint.sh

# Code file to execute when the docker container starts up (`entrypoint.sh`)
ENTRYPOINT ["/entrypoint.sh"]
