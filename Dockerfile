FROM --platform=$TARGETPLATFORM ubuntu:noble

ARG TARGETARCH
# ZenithProxy uses the name "aarch64" instead of docker's "arm64"
ENV ZENITH_ARCH_ID=${TARGETARCH/arm64/aarch64}

RUN apt-get update \
    && apt-get install -y wget unzip \
    && mkdir -p /opt/ZenithProxy \
    && cd /opt/ZenithProxy \
    && wget "https://github.com/rfresh2/ZenithProxy/releases/download/launcher-v3/ZenithProxy-launcher-linux-$ZENITH_ARCH_ID.zip" \
    && unzip "ZenithProxy-launcher-linux-$ZENITH_ARCH_ID.zip" \
    && rm "ZenithProxy-launcher-linux-$ZENITH_ARCH_ID.zip"

EXPOSE 25565
WORKDIR /opt/ZenithProxy
VOLUME /opt/ZenithProxy
CMD ./launch --unattended
