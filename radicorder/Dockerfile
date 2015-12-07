FROM cnosuke/ruby22-base
MAINTAINER cnosuke

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y \
    rtmpdump \
    libav-tools \
    libavcodec-extra-54 \
    swftools

RUN mkdir -p /gems /app /app/tmp
COPY dummy /tmp/
RUN cd /gems && git clone --depth 1 https://github.com/cnosuke/radicorder.git

WORKDIR /app
COPY Gemfile /app/
RUN cd /app && bundle install
ADD env /app/.env
COPY app.rb s3_uploader.rb /app/

CMD ["bundle", "exec", "ruby", "app.rb"]
