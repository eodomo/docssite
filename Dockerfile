FROM ghcr.io/gohugoio/hugo:latest AS build

USER root

WORKDIR /site
COPY . .
RUN hugo --minify --gc

FROM nginx:stable-alpine

COPY --from=build /site/public /usr/share/nginx/html/

EXPOSE 80
