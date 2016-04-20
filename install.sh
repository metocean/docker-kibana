#!/bin/sh
set -e

apk update
apk upgrade

# Install Node.js
apk add nodejs

# Install kibana
apk add ca-certificates
wget -O- https://download.elastic.co/kibana/kibana/kibana-$KIBANA_VERSION-linux-x64.tar.gz | tar -xz -C /usr/lib
mv /usr/lib/kibana-$KIBANA_VERSION-linux-x64 /usr/lib/kibana
mkdir -p /etc/service/kibana
cp /install/kibana.sh /etc/service/kibana/run
apk del ca-certificates

# Clean up
rm -rf /install
rm -rf /tmp/*
rm -rf /var/cache/apk/*