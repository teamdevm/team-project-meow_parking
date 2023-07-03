FROM postgres:latest

ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
ENV POSTGRES_DB=parking_information

COPY init.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
