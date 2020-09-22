FROM node as node_modules
WORKDIR /usr/share/mongection
COPY ./package*.json /usr/share/mongection/
RUN apt-get update && \
    npm install

FROM node
WORKDIR /usr/share/mongection
RUN apt-get update
COPY ./ /usr/share/mongection
COPY --from=node_modules /usr/share/mongection/node_modules ./node_modules

CMD node "--inspect=0.0.0.0" src/app.js