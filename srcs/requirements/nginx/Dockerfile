FROM alpine:3.18.3

RUN apk upgrade && apk update && apk add --no-cache nginx

COPY "requirements/nginx/conf/nginx.conf" "/etc/nginx/http.d/nginx.conf"  

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
