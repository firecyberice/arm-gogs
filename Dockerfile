FROM hypriot/rpi-alpine-scratch

RUN echo "@edge http://dl-4.alpinelinux.org/alpine/edge/main" | tee -a /etc/apk/repositories \
 && echo "@community http://dl-4.alpinelinux.org/alpine/edge/community" | tee -a /etc/apk/repositories \
 && apk -U --no-progress upgrade \
 && apk -U --no-progress add ca-certificates bash git linux-pam s6@edge curl openssh socat

ENV GOGS_CUSTOM /data/gogs

## Create git user for Gogs
RUN adduser -H -D -g 'Gogs Git User' git -h /data/git -s /bin/bash && passwd -u git && \
echo "export GOGS_CUSTOM=${GOGS_CUSTOM}" >> /etc/profile


COPY ./gogs /
COPY ./start.sh /gogs/
WORKDIR /gogs/

# Configure Docker Container
VOLUME ["/data"]
EXPOSE 22 3000
ENTRYPOINT ["./start.sh"]
#ENTRYPOINT ["docker/start.sh"]
#CMD ["/bin/s6-svscan", "/app/gogs/docker/s6/","web"]
