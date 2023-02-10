FROM php:8.2

MAINTAINER Chrissi2812

ADD provision.sh /provision.sh

RUN chmod +x /*.sh

RUN ./provision.sh
