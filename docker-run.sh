#!/bin/bash

echo Starting Redis
service redis-server start

echo NPM Install
npm install -g nodemon -- quiet
cd /data
npm install --quiet

echo Starting server
nodemon server.js