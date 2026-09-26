FROM deluan/navidrome:latest

USER root
RUN apt-get update && apt-get install -y curl fuse3 \
    && curl https://rclone.org/install.sh | bash

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER 1000:1000

EXPOSE 4533
VOLUME ["/data", "/music"]
ENTRYPOINT ["/entrypoint.sh"]
