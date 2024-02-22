FROM postgres:16.2-alpine3.19
CMD ["tini", "--", "/app/start.sh"]

RUN apk add --no-cache tini

ADD . /app/
