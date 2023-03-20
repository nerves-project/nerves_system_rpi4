# ly11-system-rpi4-build
ARG LY10_DOCKER_GO_VERSION="1.1.8"
FROM ghcr.io/bcdevices/ly10-golang-nerves-jammy:v${LY10_DOCKER_GO_VERSION}

#apt-get install -y u-boot-tools mercurial

WORKDIR /pltos
COPY . /pltos
RUN echo "StrictHostKeyChecking no " > /root/.ssh/config
#ENV ENVIRONMENT="production"
ENV GOPATH="/go"
ENV PATH="/usr/local/go/bin:/usr/local/elixir/bin:${PATH}"
#ENV MIX_ENV="prod"

# hadolint ignore=DL3020
ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
