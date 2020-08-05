FROM debian:stretch-slim

ENV MONGO_VERSION=4.2
ENV MONGO_UTILS_VERSION=${MONGO_VERSION}.8

RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y gnupg2 wget

# Install MongoDB
RUN wget -qO - https://www.mongodb.org/static/pgp/server-${MONGO_VERSION}.asc | apt-key add -
RUN echo "deb http://repo.mongodb.org/apt/debian stretch/mongodb-org/${MONGO_VERSION} main" | tee /etc/apt/sources.list.d/mongodb-org-${MONGO_VERSION}.list
RUN apt-get update

RUN apt-get install -y mongodb-org=${MONGO_UTILS_VERSION} mongodb-org-shell=${MONGO_UTILS_VERSION} mongodb-org-tools=${MONGO_UTILS_VERSION}
