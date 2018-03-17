FROM ubuntu:latest

RUN apt-get update
RUN apt-get install sudo curl wget -y

# Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list

# Node
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

# General
RUN apt-get update
RUN apt-get install python-setuptools python-dev build-essential google-chrome-stable nodejs -y
RUN apt-get clean

# Javascript
RUN npm install -g yarn
RUN npm install -g @angular/cli
RUN npm install -g node-sass

# Cloud Tools
RUN curl -O https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# AWS
RUN pip install awscli