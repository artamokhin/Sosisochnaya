FROM node:16.13.2-alpine as builder
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install  && npm run build


FROM alpine:3.17
# Create app directory
WORKDIR /dist/frontend
COPY --from=builder /dist/frontend/ /dist/frontend/
RUN npm install && npm install -g http-server
EXPOSE 80
ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-backend:8080"]