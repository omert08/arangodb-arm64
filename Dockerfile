FROM debian:stretch
MAINTAINER Ömer TABAN <omer@patron.ai>

ENV ARANGO_VERSION 3.4.10
ENV GITHUB_URL https://github.com/omert08/arangodb-arm64/####


RUN apt-get update && \
    apt-get install -y libssl-dev libjemalloc-dev curl


#RUN curl --fail -O {GITHUB_URL}/{ARANGO_VERSION}.tar.gz

#RUN tar-xzvf {ARANGO_VERSION}.tar.gz 

#RUN curl --fail -O {GITHUB_URL}/entrypoint.sh


COPY {ARANGO_VERSION}/arangod /usr/local/sbin/

RUN mkdir -p /etc/arangodb3

COPY {ARANGO_VERSION}/arangod.conf /etc/arangodb3/

RUN mkdir -p /usr/local/share/arangodb3

COPY {ARANGO_VERSION}/share/* /usr/local/share/arangodb3/

COPY {ARANGO_VERSION}/bin/* /usr/bin/


# retain the database directory and the Foxx Application directory
VOLUME ["/var/lib/arangodb3", "/var/lib/arangodb3-apps"]


COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

# standard port
EXPOSE 8529
CMD ["arangod"]

