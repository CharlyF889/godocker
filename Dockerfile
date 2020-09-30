FROM golang:1.11.0 AS builder 

RUN mkdir /app
ADD . /app
WORKDIR /app
RUN CGO_ENABLED=0 GOOS=linux go build -o main ./...

FROM alpine:latest AS production
COPY --from=builder /app .
# RUN go build - o main .
# CMD ["/app/main"]
CMD ["./main"]