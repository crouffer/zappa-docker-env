FROM    alpine:3.7

LABEL   com.chrisrouffer.maintainer="chris.rouffer@gmail.com"
LABEL   com.chrisrouffer.version="1.0"
LABEL   com.chrisrouffer.release-date="2018-06-21"
LABEL   com.chrisrouffer.vendor="Chris Rouffer"

RUN     apk update && \
        apk add --no-cache python3>3.6
