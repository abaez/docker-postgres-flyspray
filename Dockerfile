FROM postgres:latest

MAINTAINER Alejandro Baez

RUN mkdir /docker-entrypoint-initdb.d
WORKDIR /docker-entrypoint-initdb.d

RUN echo "createuser -SDR flyspray;" >> flyspray.sh
RUN echo "createdb -E UNICODE -O flyspray flyspray;" >> flyspray.sh


CMD ["exec psql ", '-h "$POSTGRES_PORT_5432_TCP_ADDR" ',
 '-p "$POSTGRES_PORT_5432_TCP_PORT" ', '-U flyspray' ]
