FROM golang:1.20
COPY . .
RUN go mod download
RUN go build -o main
EXPOSE 80:80
CMD [ "./main" ]