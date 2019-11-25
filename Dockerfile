FROM    amazonlinux:2018.03-with-sources

LABEL   com.chrisrouffer.maintainer="chris.rouffer@gmail.com"
LABEL   com.chrisrouffer.version="1.0"
LABEL   com.chrisrouffer.release-date="2018-06-21"
LABEL   com.chrisrouffer.vendor="Chris Rouffer"

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

RUN     yum install -y gcc-c++ make \
        && curl -sL https://rpm.nodesource.com/setup_10.x | bash \
        && yum install -y nodejs

COPY    requirements.txt ./
RUN     pip3 install --upgrade pip && \
        pip3 install -r requirements.txt
