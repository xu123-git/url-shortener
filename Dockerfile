FROM golang:1.20 as build-env 

ENV GOPROXY=https://goproxy.io/
#ENV GO111MODULE=on \ 
#    GOPROXY=https://goproxy.cn,direct \
#    CGO_ENABLED=0 \
#    GOOS=linux \
#    GOARCH=amd64

WORKDIR /app

COPY go.mod .
COPY go.sum .
ENV GOPROXY=goproxy.cn 
RUN go mod download
ADD . . 
RUN go build -o goapp 

FROM alpine
RUN apk update && \
   apk add ca-certificates && \
   update-ca-certificates && \
   rm -rf /var/cache/apk/*

WORKDIR /app
COPY --from=build-env /app/goapp /app
EXPOSE 8080
ENTRYPOINT ./goapp 
