FROM golang:1.15.3
RUN mkdir /go/src/image-viewer
WORKDIR /go/src/image-viewer
COPY main.go /go/src/image-viewer
RUN go build main.go
COPY gallery/ /go/src/image-viewer/gallery
COPY templates/ /go/src/image-viewer/templates
EXPOSE 8080/tcp
CMD ["./main"]