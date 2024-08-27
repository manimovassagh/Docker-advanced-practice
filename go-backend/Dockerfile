FROM golang:latest

WORKDIR /app

COPY go.mod .
COPY go.sum . 
RUN go mod download

COPY . .

EXPOSE 1234
RUN go install

CMD ["go", "run", "main.go"]
