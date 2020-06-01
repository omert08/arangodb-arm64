FROM debian:stretch
MAINTAINER Ömer TABAN <omer@patron.ai>

ENV GITHUB_URL https://github.com/omert08/arangodb-arm64/raw/master

#RUN mkdir /home/arangodb
#WORKDIR /home/arangodb

RUN apt-get update && \
    apt-get install -y libssl-dev libjemalloc-dev wget libatomic1 && \
    apt-get clean && rm -rf /var/lib/apt/lists/
 
RUN wget -q ${GITHUB_URL}/install.sh && chmod +x install.sh && ./install.sh


# retain the database directory and the Foxx Application directory
VOLUME ["/var/lib/arangodb3", "/var/lib/arangodb3-apps"]

# standard port
EXPOSE 8529
CMD ["arangod"]

