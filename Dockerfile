FROM golang:1.20
COPY go.mod .
COPY go.sum .
COPY . .
RUN go mod download
RUN go build -o main
EXPOSE 80:8080
CMD [ "./main" ]