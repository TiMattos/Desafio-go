FROM golang as builder
WORKDIR /app
COPY *.go /app
RUN go build -ldflags "-s -w" desafio-go.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/desafio-go /app/desafio-go
CMD [ "/app/desafio-go" ]