FROM phusion/passenger-ruby22:latest

MAINTAINER Antonio Sombra version: 0.1

WORKDIR /home/app

RUN sudo apt-get -y update -o Acquire::CompressionTypes::Order::=gz
RUN curl -fsSL https://get.docker.com/gpg | sudo apt-key add - && sudo rm -rf /var/lib/apt/lists/* && apt-get clean
RUN apt-get -y update && apt-get -y install -y mysql-client \
&& sudo apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD Gemfile /home/app/Gemfile
ADD Gemfile.lock /home/app/Gemfile.lock
ADD . /home/app
ADD docker/database.yml /home/app/config/database.yml
