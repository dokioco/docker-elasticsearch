FROM ubuntu:20.04

RUN apt-get update \
  && apt-get -y install wget vim openjdk-11-jre-headless
RUN wget -q https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-6.7.2.deb \
  && dpkg -i elasticsearch-6.7.2.deb \
  && rm elasticsearch-6.7.2.deb \
  && rm -rf /var/lib/apt/lists/*
ADD jvm.options /etc/elasticsearch
ADD elasticsearch.yml /etc/elasticsearch
RUN chmod 0444 /etc/elasticsearch/jvm.options /etc/elasticsearch/elasticsearch.yml

USER elasticsearch
CMD "/usr/share/elasticsearch/bin/elasticsearch"

