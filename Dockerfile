FROM alpine

# Create our user and setup Alpine for building APKs
RUN apk --no-cache add sudo make alpine-sdk coreutils && \
    chown root:root /usr/bin && \
    chmod u+s /usr/bin/sudo && \
    adduser -G abuild -g "Alpine Package Builder" -s /bin/ash -D builder && \
    echo "builder ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    mkdir /packages && \
    chown builder:abuild /packages

COPY ./info/* /home/builder

USER builder
WORKDIR /home/builder

RUN abuild-keygen -a -i -n

RUN abuild -r

#sudo apk add /home/builder/packages/builder/armhf/*.apk
