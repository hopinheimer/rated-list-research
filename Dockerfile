# source: docker.com 
FROM golang:latest

# Set destination for COPY
WORKDIR /app

# # Download Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download;

# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/reference/dockerfile/#copy
COPY * ./
RUN go build -o node

# Optional:
# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/reference/dockerfile/#expose
EXPOSE 8080

# Run
ENTRYPOINT ["./node"]
