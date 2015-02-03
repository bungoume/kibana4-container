FROM node:latest

RUN git clone https://github.com/elasticsearch/kibana.git

RUN cd /kibana && \
    npm install -g bower grunt-cli && \
    npm install && \
    yes | bower install --allow-root && \
    grunt build

RUN /kibana/build/dist/kibana/bin/kibana
