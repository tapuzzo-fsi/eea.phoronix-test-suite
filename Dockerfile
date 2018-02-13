FROM bitnami/minideb:stretch
MAINTAINER Tony Apuzzo <tony.apuzzo@flatironsjouve.com>

ARG PHORONIX_VERSION=7.6.0
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update \
    && apt-get -y install \
	aptitude apt-utils build-essential libexpat1-dev libpcre3-dev \
	libperl-dev libpng-dev libsdl-perl mesa-utils perl perl-base \
	perl-modules php-cli php-gd php-json php-xml sqlite unzip wget \
        zlib1g-dev \
    && cd /tmp \
    && wget http://phoronix-test-suite.com/releases/repo/pts.debian/files/phoronix-test-suite_${PHORONIX_VERSION}_all.deb \
    && dpkg -i phoronix-test-suite_${PHORONIX_VERSION}_all.deb \
    && rm -f phoronix-test-suite_${PHORONIX_VERSION}_all.deb
ADD run.sh /run.sh
RUN chmod a+x /run.sh
ENTRYPOINT /run.sh

