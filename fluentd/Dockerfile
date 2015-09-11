FROM cnosuke/ruby22-base
MAINTAINER cnosuke

RUN gem install fluentd
RUN gem install fluent-plugin-s3 \
                fluent-plugin-bigquery

RUN mkdir -p /fluentd/log
RUN mkdir -p /fluentd/etc
RUN mkdir -p /fluentd/plugins
COPY fluent.conf /fluentd/etc/
ONBUILD COPY fluent.conf /fluentd/etc/
ONBUILD COPY plugins/* /fluentd/plugins/

ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

EXPOSE 24224

CMD fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
