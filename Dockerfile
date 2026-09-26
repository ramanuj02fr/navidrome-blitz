FROM deluan/navidrome:latest

# blitz.cloud requires applications to run as a non-root user.
USER 1000:1000

# Navidrome's HTTP server
EXPOSE 4533

# Ask blitz.cloud to keep Navidrome's database/cache and music directory.
VOLUME ["/data", "/music"]
