FROM debian:stretch
MAINTAINER Ömer TABAN <omer@patron.ai>

ENV ARANGO_VERSION 3.4.10
#ENV GITHUB_URL https://github.com/omert08/arangodb-arm64/blob/master
ENV GITHUB_URL https://github.com/omert08/arangodb-arm64/raw/master
RUN apt-get update && \
    apt-get install -y libssl-dev libjemalloc-dev wget


RUN mkdir /home/arangodb
WORKDIR /home/arangodb

RUN wget -q ${GITHUB_URL}/${ARANGO_VERSION}.tar.gz 
RUN wget -q ${GITHUB_URL}/entrypoint.sh

RUN tar xzvf ${ARANGO_VERSION}.tar.gz
RUN mv ${ARANGO_VERSION}/arangod /usr/local/sbin/

RUN mkdir -p /etc/arangodb3

RUN mv ${ARANGO_VERSION}/arangod.conf /etc/arangodb3/

RUN mkdir -p /usr/local/share/arangodb3

RUN mv ${ARANGO_VERSION}/share/* /usr/local/share/arangodb3/

RUN mv ${ARANGO_VERSION}/bin/* /usr/bin/


# retain the database directory and the Foxx Application directory
VOLUME ["/var/lib/arangodb3", "/var/lib/arangodb3-apps"]


RUN cp entrypoint.sh /entrypoint.sh

RUN ["chmod", "+x", "/entrypoint.sh"]

ENTRYPOINT ["/entrypoint.sh"]

# standard port
EXPOSE 8529
CMD ["arangod -c /etc/arangodb3/arangod.conf"]

