#!/bin/bash

echo Cleaning up
cd /src/redis && chown -R root:root . && chmod -R 777 . && rm -f out.log stdout
cd /src && rm -Rf node_modules

echo Starting Redis
service redis-server start

echo NPM Install
npm install -g nodemon --quiet
cd /src/node_modules && chown -R root:root . && chmod -R 777 .
cd /src && npm install --quiet

echo Starting server
nodemon server.js