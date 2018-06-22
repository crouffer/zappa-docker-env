FROM    alpine:3.7

LABEL   com.chrisrouffer.maintainer="chris.rouffer@gmail.com"
LABEL   com.chrisrouffer.version="1.0"
LABEL   com.chrisrouffer.release-date="2018-06-21"
LABEL   com.chrisrouffer.vendor="Chris Rouffer"

RUN     apk update && \
        apk add --no-cache python3>3.6

#RUN     python3 -m ensurepip && \
#        rm -r /usr/lib/python*/ensurepip && \
#        pip3 install --upgrade pip setuptools && \
#        if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
#        if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
#        rm -r /root/.cache
#RUN         pip3 install --upgrade pip
#RUN         pip3 install awscli
