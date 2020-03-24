FROM php:7.4

MAINTAINER Chrissi2812

ADD provision.sh /provision.sh

RUN chmod +x /*.sh

RUN ./provision.sh
