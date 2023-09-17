## WHAT
Docker container to build an Alpine glibc package for aarch64 (arm64)

## BUILD
Build the container
`docker build -t docker-alpine-aarch64-glibc-builder .`

## USE
Start the container and mount your local directory
`docker run -v $PWD:/home/volume -it --rm docker-alpine-aarch64-glibc-builder /bin/bash`

Copy the .apk files out of the container
`cp /home/builder/packages/builder/armhf/* /home/volume`
