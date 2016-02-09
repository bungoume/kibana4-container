FROM nginx

WORKDIR /data

RUN \
  apt-get update && apt-get -y upgrade && apt-get -y install wget curl && \
  wget https://download.elastic.co/kibana/kibana/kibana-4.4.0-linux-x64.tar.gz && \
  tar zxvf kibana-4.4.0-linux-x64.tar.gz && \
  mv kibana-4.4.0-linux-x64 kibana

ADD kibana.yml /data/kibana/config/

RUN \
  kibana/bin/kibana plugin --install elastic/sense && \
  kibana/bin/kibana plugin --install elasticsearch/marvel/latest && \
  kibana/bin/kibana plugin --install kibana/timelion

VOLUME ["/data"]

CMD ['/data/kibana/bin/kibana']
