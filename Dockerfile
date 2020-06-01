FROM debian:stretch
MAINTAINER Ömer TABAN <omer@patron.ai>

ENV GITHUB_URL https://github.com/omert08/arangodb-arm64/raw/master

#RUN mkdir /home/arangodb
#WORKDIR /home/arangodb

RUN apt-get update && \
    apt-get install -y libssl-dev libjemalloc-dev wget libatomic1
 
RUN wget -q ${GITHUB_URL}/install.sh && chmod +x install.sh && ./install.sh


# retain the database directory and the Foxx Application directory
VOLUME ["/var/lib/arangodb3", "/var/lib/arangodb3-apps"]


#RUN cp entrypoint.sh /entrypoint.sh
COPY docker-entrypoint.sh /entrypoint.sh
RUN ["chmod", "+x", "entrypoint.sh"]
ENTRYPOINT ["/entrypoint.sh"]

# standard port
EXPOSE 8529
CMD ["arangod"]

