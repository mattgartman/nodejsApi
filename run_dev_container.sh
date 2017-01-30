#/bin/bash
docker run -d -v /home/matt/dev/nodejsApi/src:/usr/src/app -p 3000:3000 mattgartman/nodejsapi:v0.0.1d nodemon /usr/src/app/server.js
