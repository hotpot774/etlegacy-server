FROM ubuntu:20.04
LABEL maintainer="hotpot774"
ENV APP_PATH=/etlegacy
WORKDIR $APP_PATH

    #Install "curl"
RUN apt-get update && \
    apt-get install -y curl && \
    #Download and run ET: Legacy 2.77.1 install script
    curl -o etlegacy-v2.77.1-x86_64.sh https://www.etlegacy.com/download/file/255 -L && \
    printf '%s\n' y n y|/bin/sh ./etlegacy-v2.77.1-x86_64.sh

#Copy etl_server.cfg etc...
COPY fs_basepath/ ./
#Copy original map files etc...
COPY fs_homepath/ /.etlegacy/

#Remove "curl" and add "sed" to the entrypoint file
RUN apt-get purge -y curl && \
    apt-get -y clean && \
    #Remove the apt list
    rm -rf /var/lib/apt/lists/*

EXPOSE 27960/udp
USER root
ENTRYPOINT ./etlded_bot.sh
