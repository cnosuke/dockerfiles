FROM ubuntu:latest
MAINTAINER cnosuke

ENV HOME /root
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install \
  build-essential \
  wget \
  zip \
  htop \
  git \
  emacs

RUN mkdir -p /tmp
RUN cd /tmp && wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
RUN cd /tmp && tar -xzvf ruby-install-0.5.0.tar.gz
RUN cd /tmp/ruby-install-0.5.0/ && make install
RUN /tmp/ruby-install-0.5.0/bin/ruby-install --system ruby 2.2.2

RUN gem install bundler

CMD ["/bin/bash"]
