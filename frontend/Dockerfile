FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/node:16.13.2-alpine as builder
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install  && npm run build


FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/node:16.13.2-alpine
# Create app directory
WORKDIR /dist/frontend
COPY --from=builder /usr/src/app/dist/frontend ./
RUN ls -lh
RUN pwd
RUN npm install -g http-server
EXPOSE 80
ENTRYPOINT ["http-server", "./", "-p", "80", "--proxy", "http://sausage-backend:8080"]