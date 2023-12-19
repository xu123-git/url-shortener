FROM golang:1.20.0
COPY . .
RUN go mod download
RUN build -o main
CMD [ "./main" ]