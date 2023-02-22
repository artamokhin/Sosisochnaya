FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/node:16.13.2-alpine as builder
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install  && npm run build


FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/alpine:3.15.0
# Create app directory
WORKDIR /dist/frontend
COPY --from=builder /usr/src/app/dist/frontend ./
RUN npm install && npm install -g http-server
EXPOSE 80
ENTRYPOINT ["http-server", "dist/frontend/", "-p", "80", "--proxy", "http://sausage-backend:8080"]