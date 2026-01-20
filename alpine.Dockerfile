# Alpine version only supports `java` release channel
# but the container may be a bit smaller
# so if you need plugins, this may be an option to test
# but otherwise, i recommend using the default ubuntu dockerfile on the `linux` release channel

FROM --platform=$TARGETPLATFORM eclipse-temurin:25.0.1_8-jre-alpine-3.23

ARG TARGETARCH
# ZenithProxy uses the name "aarch64" instead of docker's "arm64"
ENV ZENITH_ARCH_ID=${TARGETARCH/arm64/aarch64}

RUN apk add bash wget unzip \
    && mkdir -p /opt/ZenithProxy \
    && cd /opt/ZenithProxy \
    && wget "https://github.com/rfresh2/ZenithProxy/releases/download/launcher-v3/ZenithProxy-launcher-alpine-$ZENITH_ARCH_ID.zip" \
    && unzip "ZenithProxy-launcher-alpine-$ZENITH_ARCH_ID.zip" \
    && rm "ZenithProxy-launcher-alpine-$ZENITH_ARCH_ID.zip"

EXPOSE 25565
WORKDIR /opt/ZenithProxy
VOLUME /opt/ZenithProxy
CMD ./launch --unattended
