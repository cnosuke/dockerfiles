FROM cnosuke/ruby22-base
MAINTAINER cnosuke

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
  fonts-takao \
  imagemagick \
  libmagickwand-dev \
  memcached \
  xvfb \
  qt5-default \
  libqt5webkit5-dev \
  cutycapt

COPY updateGit .
RUN git clone --depth 1 https://github.com/cnosuke/ytenki.git /app

RUN echo "gem 'unicorn'" >> /app/Gemfile
RUN cd /app && bundle install

ADD run.sh /app/run.sh
ADD unicorn.rb /app/unicorn.rb
ADD memcached.conf /etc/memcached.conf
RUN mkdir -p /app/tmp /app/log /tmp

EXPOSE 8080
CMD ["/app/run.sh"]
