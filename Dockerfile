FROM node:20.18.0-bookworm-slim AS build-klecks

WORKDIR /app/klecks
COPY klecks/package.json klecks/package-lock.json ./
COPY klecks/src src
RUN npm ci
RUN npm run lang:build
RUN npm run build:embed
RUN npm run build:help

FROM nginx:1.27.2-alpine

WORKDIR /app
COPY --from=build-klecks /app/klecks/dist /public
COPY index.html /public/index.html
COPY nginx.conf /etc/nginx/templates/default.conf.template
EXPOSE 80
