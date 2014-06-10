#!/bin/bash

echo Cleaning up
cd /data/redis && chown -R root:root . && chmod -R 777 . && rm -f out.log stdout
cd /data && rm -Rf node_modules

echo Starting Redis
service redis-server start

echo NPM Install
npm install -g nodemon --quiet
cd /data/node_modules && chown -R root:root . && chmod -R 777 .
cd /data && npm install --quiet

echo Starting server
nodemon server.js