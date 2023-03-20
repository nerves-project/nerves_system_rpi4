# ly11-system-rpi4-build
ARG LY10_DOCKER_GO_VERSION="1.1.8"
FROM ghcr.io/bcdevices/ly10-golang-nerves-jammy:v${LY10_DOCKER_GO_VERSION}

#RUN echo "StrictHostKeyChecking no " > /root/.ssh/config
#ENV GOPATH="/go"
ENV PATH="/usr/local/go/bin:/usr/local/elixir/bin:${PATH}"

# hadolint ignore=DL3020
ADD entrypoint.sh /entrypoint.sh
CMD ["/entrypoint.sh"]
