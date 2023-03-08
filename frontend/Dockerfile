FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/node:16.13.2-alpine as builder
# Create app directory
WORKDIR /usr/src/app
COPY . .
RUN npm install  && npm run build


FROM gitlab.praktikum-services.ru:5050/std-012-056/sausage-store/nginxproxy/nginx-proxy
COPY nginx.tmpl /app
WORKDIR /usr/share/nginx/html
COPY --from=builder /usr/src/app/dist/frontend ./
EXPOSE 80