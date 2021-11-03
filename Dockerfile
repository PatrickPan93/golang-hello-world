# syntax=docker/dockerfile:1

#FROM golang:1.16-alpine

#WORKDIR /app

#COPY * ./

#RUN go mod download && go build -o app

#EXPOSE 8080

#CMD [ "/app/app" ]

FROM alpine:3.13.6

COPY app ./
# 修改alpine源为阿里云
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories && \
  apk update && \
  apk upgrade && \
  apk add ca-certificates && update-ca-certificates && \
  apk add --update tzdata && \
  apk add upx && \
  upx ./app && \
  rm -rf /var/cache/apk/*

ENV TZ=Asia/Shanghai

EXPOSE 8080

ENTRYPOINT ./app