#!/usr/bin/with-contenv bash

# Create Folders & Simlinks, if missing
if [ ! -L "/root/.urlwatch" ]; then
	mkdir -p /config/.urlwatch/
fi

# Copy over default files
if [ ! -f "/config/.urlwatch/urlwatch.yaml" ]; then
    cp /defaults/urlwatch/urlwatch.yaml /config/.urlwatch/urlwatch.yaml
fi

if [ ! -f "/config/.urlwatch/urls.yaml" ]; then
    cp /defaults/urlwatch/urls.yaml /config/.urlwatch/urls.yaml
fi

# permissions
chown -R abc:abc \
	/config \
	/root

# run update on startup
exec \
	su -s /bin/bash -c '/usr/bin/urlwatch' -l abc
