FROM golang:1.15.3
RUN mkdir /go/src/image-viewer
WORKDIR /go/src/image-viewer
COPY main.go main.go
COPY gallery/ gallery/
COPY templates/ templates/
RUN go build -o bin/main
EXPOSE 8080/tcp
CMD ["./bin/main"]