FROM drone/drone
MAINTAINER cnosuke

ADD drone.toml.sample /etc/drone/drone.toml

EXPOSE 80
VOLUME ["/var/lib/drone"]
ENTRYPOINT ["/usr/local/bin/droned", "--config=/etc/drone/drone.toml"]
