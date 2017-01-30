FROM node:7.4.0


ARG ENVIRONMENT=prod
ENV ENVIRONMENT ${ENVIRONMENT}


RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

#seems like a common pratice to copy just package.json and npm install without the rest of source, why?
COPY ./src/package.json /usr/src/app
RUN npm install
COPY ./src /usr/src/app

#Install nodemon if development
RUN ["/bin/bash", "-c", "if [ $ENVIRONMENT == \"dev\" ]; then npm install --global nodemon; echo \"DEV ONLY\" > /usr/src/app/app_env.txt; fi"]

#Allow developers to point to their local machine, anyway to only do this for dev or otherwise control that non dev envrionments can't mount this volume?'
VOLUME /usr/src/app

#Change to non-root user, user built into base image
USER node
ENV HOME /home/node

EXPOSE 3000
CMD [ "npm", "start"]