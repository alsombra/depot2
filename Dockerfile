FROM phusion/passenger-ruby22:latest

MAINTAINER Antonio Sombra version: 0.1

WORKDIR /home/app

ADD Gemfile /home/app/Gemfile
ADD Gemfile.lock /home/app/Gemfile.lock
RUN bundle install
RUN curl -fsSL https://get.docker.com/gpg | sudo apt-key add - && sudo rm -rf /var/lib/apt/lists/* && apt-get clean
RUN sudo apt-get -y update -o Acquire::CompressionTypes::Order::=gz
RUN apt-get install -y mysql-client \
&& sudo apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD . /home/app
ADD docker/database.yml /home/app/config/database.yml
