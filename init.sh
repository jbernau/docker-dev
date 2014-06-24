#!/bin/bash

echo "starting redis..."
service redis-server start
echo "done"

ln -s /tmp/node_modules /src

echo "starting node"
nodemon server.js
