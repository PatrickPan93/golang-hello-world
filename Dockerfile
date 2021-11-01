# syntax=docker/dockerfile:1

FROM golang:1.16-alpine

WORKDIR /app

COPY * ./

RUN go mod download && go build -o app

EXPOSE 8080

CMD [ "/app/app" ]