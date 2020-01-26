FROM ubuntu:18.04

LABEL maintainer="hotpot774"

# Install prereqs
RUN apt-get update && apt-get install -y \
    curl && \
    rm -rf /var/lib/apt/lists/*

#Install ET: Legacy 2.76 from the official website
RUN curl https://www.etlegacy.com/download/file/121 | tar xvz; mv etlegacy-v2.76-x86_64 etlegacy

#Copy etmain
COPY etmain/ /etlegacy/etmain/

#Add a sed command to the entrypoint

#RUN sed -i '1s|^|hogehoge\n|' /etlegacy/etlded_bot.sh
RUN sed -i '1i sed\x20-i\x20-e\x20\x27\x2f\x5eset\x20g_password\x2fc\x5cset\x20g_password\x20\x22\x27\x24G_PASSWORD\x27\x22\x27\x20\x2fetlegacy\x2fetmain\x2fetl_server\x2ecfg' /etlegacy/etlded_bot.sh

EXPOSE 27960/udp
USER root
WORKDIR /etlegacy
ENTRYPOINT ./etlded_bot.sh
