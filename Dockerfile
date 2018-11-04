FROM ubuntu:16.04
MAINTAINER Mindaugas K. <kasp.mindaugas@gmail.com>

# Add dependencies
RUN apt-get update && apt-get install -y --no-install-recommends apt-utils
RUN apt-get install debdelta -y && \
    debdelta-upgrade
RUN apt-get install -y curl git git-core && \
    apt-get install -y build-essential ffmpeg nodejs python 
RUN apt-get install -y npm nodejs
RUN apt-get autoremove -y

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY package.json /usr/src/app/
RUN npm install
