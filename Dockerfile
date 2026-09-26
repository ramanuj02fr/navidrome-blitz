FROM deluan/navidrome:latest

USER root
RUN apt-get update && apt-get install -y curl fuse3 \
    && curl https://rclone.org/install.sh | bash

USER 1000:1000

EXPOSE 4533
VOLUME ["/data", "/music"]
