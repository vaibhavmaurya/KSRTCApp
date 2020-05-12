# production environment
# phase 1 : build project
# phase 2 : start nginx

# Phase 1
FROM node:alpine as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm build

#  phase 2
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
# nginx listens at port 80, so map accordingly

