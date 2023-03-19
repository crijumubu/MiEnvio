FROM node:18.14.1

COPY [".", "/usr/src/"]

WORKDIR /usr/src/

RUN npm install

EXPOSE 3000

CMD ["node", "dist/server.js"]