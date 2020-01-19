FROM ubuntu:18.04

LABEL maintainer="hotpot774"

# Install prereqs
RUN apt-get update && apt-get install -y \
    curl \
    && rm -rf /var/lib/apt/lists/*

#Install ET: Legacy 2.76 from the official website
RUN curl https://www.etlegacy.com/download/file/121 | tar xvz; mv etlegacy-v2.76-x86_64 etlegacy

#Copy the basis pk3 and server settings files from the same directory
COPY pak[0-2].pk3 etl_server.cfg /etlegacy/etmain/
COPY cinfo.sh /etlegacy/

#Add cinfo.sh to the beginning of etlded_bot.sh
RUN chmod 744 /etlegacy/cinfo.sh && \
    cat /etlegacy/etlded_bot.sh >> /etlegacy/cinfo.sh && \
    rm -f /etlegacy/etlded_bot.sh && \
    mv /etlegacy/cinfo.sh /etlegacy/etlded_bot.sh

EXPOSE 27960/udp
USER root
WORKDIR /etlegacy
ENTRYPOINT ./etlded_bot.sh
