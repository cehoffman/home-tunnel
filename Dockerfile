FROM alpine

RUN apk --update --no-cache add openssh

COPY known_hosts /etc/ssh/ssh_known_hosts
COPY tunnel.conf /root/.ssh/config

RUN chmod 600 /root/.ssh/config

ENTRYPOINT ["/usr/bin/ssh"]
CMD ["-nNTv", "home"]
