#!/usr/bin/with-contenv bash

# Create Folders & Simlinks, if missing
if [ ! -d "/config/.urlwatch" ]; then
	mkdir -p /config/.urlwatch/
fi

if [ ! -d "/config/crontabs" ]; then
	mkdir -p /config/crontabs/
fi

# Copy over default files
if [ ! -f "/config/.urlwatch/urlwatch.yaml" ]; then
    cp /defaults/urlwatch/urlwatch.yaml /config/.urlwatch/urlwatch.yaml
fi

if [ ! -f "/config/.urlwatch/urls.yaml" ]; then
    cp /defaults/urlwatch/urls.yaml /config/.urlwatch/urls.yaml
fi

if [ ! -f "/config/crontabs/abc" ]; then
    cp /defaults/crontabs/abc /config/crontabs/abc
fi

if [ ! -L "/etc/crontabs/abc" ]; then
    ln -s /config/crontabs/abc /etc/crontabs/abc
fi
# permissions
chown -R abc:abc \
	/config

# run update on startup
exec \
	su -s /bin/bash -c '/usr/bin/urlwatch' -l abc
