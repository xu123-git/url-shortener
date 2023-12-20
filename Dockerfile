FROM golang:1.20
COPY . .
RUN GOPROXY=goproxy.cn go mod download
RUN go build -o main
CMD [ "./main" ]
