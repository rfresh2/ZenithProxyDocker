# ZenithProxy Docker

<p align="center">
  <a href="https://discord.gg/nJZrSaRKtb">
  <img alt="Discord" src="https://dcbadge.vercel.app/api/server/nJZrSaRKtb">
  </a>
</p>


[ZenithProxy](https://github.com/rfresh2/ZenithProxy) is a minecraft proxy / bot

This repo contains a Dockerfile and docker-compose.yml to run ZenithProxy in a container.

For general Docker usage, see [Docker CLI](https://docs.docker.com/reference/cli/docker/)

# Usage

## Docker Compose

Edit the `docker-compose.yml` file to set required environment variables

```yaml
    environment:
      ZENITH_DISCORD_TOKEN: <token>
      ZENITH_DISCORD_CHANNEL_ID: <channel id>
      ZENITH_DISCORD_ROLE_ID: <role id>
```

Then run:

```bash
docker compose up -d
```

## Docker CLI:

```bash
docker run \
  -d \
  --name zenithproxy \
  -e ZENITH_DISCORD_TOKEN=<token> \
  -e ZENITH_DISCORD_CHANNEL_ID=<channel id> \
  -e ZENITH_DISCORD_ROLE_ID=<role id> \
  -p 25565:25565 \
  ghcr.io/rfresh2/zenithproxy:latest
```

## Docker Package

https://github.com/rfresh2/ZenithProxyDocker/pkgs/container/zenithproxy

Tag: `ghcr.io/rfresh2/zenithproxy:latest`

Or build an image yourself:

```bash
docker build -t zenithproxy .
```

## Environment Variables

Environment variables are used to configure the ZenithProxy launcher without input prompts in the terminal.

Many are optional, some are required.

For a full list, see docker-compose.yml
