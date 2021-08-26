FROM node:16-alpine3.11

RUN mkdir /app
COPY index.js /app/index.js
COPY package.json /app/package.json

WORKDIR /app
RUN npm install

ENTRYPOINT [ "node", "index.js" ]