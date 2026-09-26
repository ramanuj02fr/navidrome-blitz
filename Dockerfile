FROM deluan/navidrome:latest

USER root
RUN apk add --no-cache curl fuse3 unzip \
    && curl https://rclone.org/install.sh | bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER 1000:1000

EXPOSE 4533
VOLUME ["/data", "/music"]
ENTRYPOINT ["/entrypoint.sh"]
