FROM dockerfile/ubuntu

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

# Install Redis
RUN   \
  apt-get -y -qq install python redis-server

# Install Node
RUN   \
  cd /opt && \
  wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz && \
  tar -xzf node-v0.10.28-linux-x64.tar.gz && \
  mv node-v0.10.28-linux-x64 node && \
  cd /usr/local/bin && \
  ln -s /opt/node/bin/* . && \
  rm -f /opt/node-v0.10.28-linux-x64.tar.gz


ADD package.json /tmp/package.json
RUN cd /tmp && npm install
RUN cd /tmp && npm install -g nodemon
#RUN mkdir /src && cp -a /tmp/node_modules /src

ADD init.sh /init/init.sh

# Set the working directory
WORKDIR   /src

CMD [ "/bin/bash", "/init/init.sh" ]
