FROM postgres:14-alpine
# Инициализация ДБ c помощью локального init файла
COPY --chown=postgres:postgres ./init.sql /docker-entrypoint-initdb.d/init.sql
