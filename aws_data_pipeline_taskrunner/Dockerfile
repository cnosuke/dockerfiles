FROM ubuntu:latest
MAINTAINER cnosuke

ENV HOME /root
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install \
  build-essential \
  wget \
  htop \
  git \
  emacs

# Enable install via ppa
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get install apt-file -y
RUN apt-file update
RUN apt-file search add-apt-repository
RUN apt-get install software-properties-common -y

RUN add-apt-repository ppa:webupd8team/java && \
    apt-get update

# License agreement and Installing Oracle Java
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install oracle-java8-installer -y

RUN mkdir -p /work
WORKDIR /work
RUN curl -LO "https://s3.amazonaws.com/datapipeline-us-east-1/us-east-1/software/latest/TaskRunner/TaskRunner-1.0.jar"

ENTRYPOINT ["java", "-jar", "TaskRunner-1.0.jar", "--accessId=$AWS_ACCESS_KEY_ID", "--secretKey=$AWS_SECRET_ACCESS_KEY", "--region=$AWS_REGION", "--logUri=$S3_LOG_URI", "--workerGroup=$WORKGROUP"]

CMD ["--workerGroup=my_worker_group"]
