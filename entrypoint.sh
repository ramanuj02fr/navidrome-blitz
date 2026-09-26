#!/bin/sh
mkdir -p /tmp/rclone-config
cat > /tmp/rclone-config/rclone.conf <<EOF
[b2]
type = b2
account = ${B2_ACCOUNT}
key = ${B2_KEY}
EOF

rclone --config /tmp/rclone-config/rclone.conf mount b2:${B2_BUCKET} /music \
  --allow-other --vfs-cache-mode writes --daemon 2>&1

sleep 3
echo "===== Checking if mount succeeded ====="
ls -la /music || echo "MOUNT FAILED - /music not accessible"
mount | grep music || echo "No fuse mount found in mount table"

exec /navidrome
