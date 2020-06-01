#!/bin/sh

ARANGO_VERSION=3.4.10
#ENV GITHUB_URL https://github.com/omert08/arangodb-arm64/blob/master
GITHUB_URL=https://github.com/omert08/arangodb-arm64/raw/master

wget -q $GITHUB_URL/$ARANGO_VERSION.tar.gz
wget -q $GITHUB_URL/docker-entrypoint.sh

tar xzvf ./$ARANGO_VERSION.tar.gz
mv ./$ARANGO_VERSION/arangod /usr/sbin/

mv ./$ARANGO_VERSION/arango-init-database /usr/sbin/

mkdir -p /etc/arangodb3

mv ./$ARANGO_VERSION/arangod.conf /etc/arangodb3/

mkdir -p /usr/share/arangodb3

mv ./$ARANGO_VERSION/share/* /usr/share/arangodb3/

mv ./$ARANGO_VERSION/bin/* /usr/bin/

rm $ARANGO_VERSION.tar.gz
rm -r ./$ARANGO_VERSION

