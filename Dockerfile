FROM kibana:4.4

RUN \
  kibana plugin --install elastic/sense && \
  kibana plugin --install elasticsearch/marvel/latest && \
  kibana plugin --install kibana/timelion && \
  chown -R kibana:kibana /opt/kibana

EXPOSE 5601
