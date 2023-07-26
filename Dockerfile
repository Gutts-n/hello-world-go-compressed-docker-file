FROM golang AS hello-world-file-builded

WORKDIR /usr/src/app

RUN go mod init hello-world

COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o hello-world-compiled .

FROM hello-world

WORKDIR /usr/src/app

COPY --from=hello-world-file-builded /usr/src/app/hello-world-compiled .

ENTRYPOINT [ "./hello-world-compiled" ]
