FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
  wget \
  xz-utils \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /
RUN mkdir /sfdx \
    && wget -qO- https://developer.salesforce.com/media/salesforce-cli/sfdx-linux-amd64.tar.xz | tar xJ -C sfdx --strip-components 1 \
    && /sfdx/install \
    && rm -rf /sfdx

RUN apt-get update && apt-get install -y wget curl jq git nodejs \
   && rm -rf /var/lib/apt/lists/*

ARG CACHEBUST=1
RUN sfdx update
