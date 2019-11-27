FROM    amazonlinux:2018.03-with-sources

# For microbadger labels
ARG     BUILD_DATE
ARG     VCS_REF
ARG     VERSION
LABEL   org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.name="Zappa Build Environment" \
        org.label-schema.description="Build Python apps and libraries for running on AWS Lambda, deployed with Zappa" \
        org.label-schema.url="https://github.com/crouffer/zappa-docker-env" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/crouffer/zappa-docker-env" \
        org.label-schema.vendor="Chris Rouffer" \
        org.label-schema.vendor="chris.rouffer@gmail.com" \
        org.label-schema.version=$VERSION \
        org.label-schema.schema-version="1.0"

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
