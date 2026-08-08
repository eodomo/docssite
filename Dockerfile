FROM ghcr.io/gohugoio/hugo:latest AS build

USER root

WORKDIR /site
COPY . .
RUN hugo --minify --gc

FROM nginx:stable-alpine

RUN rm -rf /usr/share/nginx/html/*

COPY --from=build /site/public /usr/share/nginx/html/

EXPOSE 80
