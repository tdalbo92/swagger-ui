FROM nginx

MAINTAINER tdalbo92

ENV VERSION "v2.2.10"
ENV FOLDER "swagger-ui-2.2.10"
ENV API_URL "**None**"
ENV API_KEY "**None**"
ENV OAUTH_CLIENT_ID "**None**"
ENV OAUTH_CLIENT_SECRET "**None**"
ENV OAUTH_REALM "**None**"
ENV OAUTH_APP_NAME "**None**"
ENV OAUTH_ADDITIONAL_PARAMS "**None**"
ENV SWAGGER_JSON "/app/swagger.json"
ENV PORT 80

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/

# copy swagger files to the `/js` folder
ADD ./dist/* /usr/share/nginx/html/
ADD ./docker-run.sh /usr/share/nginx/

EXPOSE 8080

CMD ["bash", "/usr/share/nginx/docker-run.sh"]
