FROM node:carbon

RUN apt-get install wget -y

# Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list

# General
RUN apt-get update
RUN apt-get install python-setuptools python-dev build-essential google-chrome-stable -y
RUN apt-get clean

# Javascript
RUN npm install -g yarn

# Packages
RUN yarn add global npm@latest
RUN yarn add global @angular/cli@latest
RUN yarn add global node-sass@latest
RUN yarn add global typescript@latest

# Cloud Tools
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# AWS
RUN pip install awscli