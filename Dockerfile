FROM nginx

WORKDIR /data

RUN \
  apt-get update && apt-get -y upgrade && apt-get -y install wget curl && \
  wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.2-linux-x64.tar.gz && \
  tar zxvf kibana-4.0.2-linux-x64.tar.gz && \
  mv kibana-4.0.2-linux-x64 kibana

ADD kibana.yml /data/kibana/config/

VOLUME ["/data"]

CMD ['/data/kibana/bin/kibana']
