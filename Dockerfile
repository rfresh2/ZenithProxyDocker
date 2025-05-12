FROM debian:stable-slim

ARG TARGETARCH
ENV ARCH_FILENAME=""

RUN mkdir /opt/ZenithProxy
RUN apt-get update && apt-get install -y wget unzip
RUN cd /opt/ZenithProxy
#  Set ARCH_FILENAME based on TARGETARCH as "aarch64" is used instead of "arm64" in the filename
RUN if [ "$TARGETARCH" = "amd64" ]; then \
        ARCH_FILENAME="amd64"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
        ARCH_FILENAME="aarch64"; \
    else \
        echo "Unsupported architecture: $TARGETARCH" && exit 1; \
    fi && \
    wget https://github.com/rfresh2/ZenithProxy/releases/download/launcher-v3/ZenithProxy-launcher-linux-${ARCH_FILENAME}.zip && \
    unzip ZenithProxy-launcher-linux-${ARCH_FILENAME}.zip && \
    rm ZenithProxy-launcher-linux-${ARCH_FILENAME}.zip

EXPOSE 25565
WORKDIR /opt/ZenithProxy
CMD ./launch --unattended
