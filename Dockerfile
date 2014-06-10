FROM dockerfile/ubuntu

MAINTAINER Abhinav Ajgaonkar <abhinav316@gmail.com>

# Install Redis
RUN	\
	apt-get -y -qq install python redis-server

# Install Node
RUN	\
	cd /opt && \
	wget http://nodejs.org/dist/v0.10.28/node-v0.10.28-linux-x64.tar.gz && \
	tar -xzf node-v0.10.28-linux-x64.tar.gz && \
	mv node-v0.10.28-linux-x64 node && \
	cd /usr/local/bin && \
	ln -s /opt/node/bin/* . && \
	rm -f /opt/node-v0.10.28-linux-x64.tar.gz

# Link the redis config
RUN \
	cd /etc/redis && \
	mv redis.conf redis.conf.default && \
	ln -s /data/conf/redis.conf