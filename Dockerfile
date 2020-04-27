FROM ubuntu:18.04

LABEL maintainer="hotpot774"

# Install curl
RUN apt-get update && \
    apt-get install -y curl

#Install ET: Legacy 2.76 from the official website
RUN curl https://www.etlegacy.com/download/file/121 | tar xvz; mv etlegacy-v2.76-x86_64 etlegacy

#Copy etmain
COPY etmain/ /etlegacy/etmain/

#Copy custom pk3 files, including sound files
COPY pak3/ /etlegacy/legacy/

#Remove prereqs and add a sed command to the entrypoint file
RUN apt-get purge -y curl && \
    apt-get -y clean && \
    #Remove the apt list
    rm -rf /var/lib/apt/lists/* && \
    #Add a sed command to the entrypoint file
    sed -i '1i sed\x20-i\x20-e\x20\x27\x2f\x5eset\x20g_password\x2fc\x5cset\x20g_password\x20\x22\x27\x24G_PASSWORD\x27\x22\x27\x20\x2fetlegacy\x2fetmain\x2fetl_server\x2ecfg' /etlegacy/etlded_bot.sh

EXPOSE 27960/udp
USER root
WORKDIR /etlegacy
ENTRYPOINT ./etlded_bot.sh

