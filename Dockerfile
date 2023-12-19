FROM golang:1.20
COPY . .
ENV GOPROXY=goproxy.cn 
RUN go mod download
RUN go build -o main
EXPOSE 80:8080
CMD [ "./main" ]