FROM alpine as build-env
ARG fileName=main.c
RUN apk add --no-cache build-base
WORKDIR /app
COPY . .
# Compile the binaries
RUN gcc -o hello $fileName
FROM alpine
COPY --from=build-env /app/hello /app/hello
WORKDIR /app
CMD ["/app/hello"] 