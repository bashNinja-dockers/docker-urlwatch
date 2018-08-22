FROM lsiobase/alpine.python3:latest

# set version label
ARG BUILD_DATE
ARG VERSION
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="Mike Weaver"

# environment settings
#ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENV EDITOR="nano"

RUN \
 echo "**** install build packages ****" && \
 apk add --no-cache --virtual=build-dependencies \
	g++ \
	gcc \
	python-dev && \
 echo "**** install depends ****" && \
 apk add --no-cache \
	nano && \
 echo "**** install pip packages & app ****" && \
 pip install --no-cache-dir -U \
	minidb \
	requests \
	appdirs \
	chump \
	pushbullet.py \
	requests-html \
	keyring \
	urlwatch \
	pyyaml && \
 echo "**** cleanup ****" && \
 apk del --purge \
	build-dependencies && \
 rm -rf \
	/root/.cache

# add local files
COPY root/ /

# ports and volumes
VOLUME /config
