FROM alpine:3.18

LABEL tag="nginx"

RUN apk update && apk upgrade && apk add --no-cache nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
