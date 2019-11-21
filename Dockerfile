FROM    amazonlinux:2018.03-with-sources

LABEL   com.chrisrouffer.maintainer="chris.rouffer@gmail.com"
LABEL   com.chrisrouffer.version="1.0"
LABEL   com.chrisrouffer.release-date="2018-06-21"
LABEL   com.chrisrouffer.vendor="Chris Rouffer"

RUN     yum update -y && \
        yum install -y \
        python36

ENV     LC_ALL=en_US.UTF-8
ENV     LANG=en_US.UTF-8

RUN     yum install -y \
        gcc \
        python36 \
        python36-devel \
        python36-setuptools \
        python3-pip

RUN     easy_install-3.6 pip

ENV     PYMSSQL_BUILD_WITH_BUNDLED_FREETDS=1

COPY    requirements.txt ./
RUN     pip3 install --upgrade pip && \
        pip3 install -r requirements.txt
