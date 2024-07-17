FROM mysql

EXPOSE 3306

COPY ./schema.sql /docker-entrypoint-initdb.d/schema.sql

CMD ["mysqld"]
