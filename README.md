# Navidrome on blitz.cloud

This repository is intended for deploying Navidrome on blitz.cloud.

## Deploy

1. Push these files to a **public GitHub repository**.
2. In blitz.cloud choose **My own code**.
3. Paste the public GitHub repository URL.
4. Choose the Dockerfile in the repository if prompted.
5. Deploy the app.

The container listens on port 4533.

## Important

Navidrome needs:
- `/data` for its database/cache
- `/music` for the music library

blitz.cloud keeps Docker `VOLUME` folders across restarts, but the free plan does not back up kept files. Keep your original music elsewhere too.

After deployment, open the generated HTTPS address. The first visit should show Navidrome's setup/login page.

## Why this Dockerfile exists

The official Navidrome image is suitable for Docker, and Navidrome documents running it as UID/GID 1000:1000. blitz.cloud requires applications to run as a non-root user, so this image simply changes the runtime user to 1000:1000 while keeping the official Navidrome image and entrypoint.

## Music upload

Do not put a large music collection directly into the Git repository. First get the Navidrome app running; then we can decide how to populate `/music` using whatever persistent-file mechanism is available in the blitz.cloud account.
