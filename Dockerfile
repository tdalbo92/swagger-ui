FROM alpine:3.5

MAINTAINER fehguy

ENV VERSION "v2.2.10"
ENV FOLDER "swagger-ui-2.2.10"
ENV API_URL "http://petstore.swagger.io/v2/swagger.json"
ENV API_KEY "**None**"
ENV OAUTH_CLIENT_ID "**None**"
ENV OAUTH_CLIENT_SECRET "**None**"
ENV OAUTH_REALM "**None**"
ENV OAUTH_APP_NAME "**None**"
ENV OAUTH_ADDITIONAL_PARAMS "**None**"
ENV SWAGGER_JSON "/app/swagger.json"
ENV PORT 80

RUN apk add --update nginx
RUN mkdir -p /run/nginx

COPY nginx.conf /etc/nginx/

# Let's see if we can avoid running as root
RUN mkdir -p /nginx

# copy swagger files to the `/js` folder
ADD ./dist/* /nginx/html/
ADD ./docker-run.sh /nginx/

EXPOSE 8080

CMD ["sh", "/nginx/docker-run.sh"]
