FROM node:18.14.1

COPY ["backend", "/usr/src/"]

WORKDIR /usr/src/

RUN npm install

EXPOSE 1802

CMD ["node", "dist/server.js"]