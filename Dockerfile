#
# Usage: From the "Docker Quickstart Terminal", execute:
#
#  docker build -t bcdevices/ly11-system-rpi4 .
#
# References:
# - https://docs.docker.com/reference/builder/
# - https://docs.docker.com/articles/dockerfile_best-practices/
#
# --
#
# Confidential!!!
# Source code property of Blue Clover Design LLC.
#
# Demonstration, distribution, replication, or other use of the
# source codes is NOT permitted without prior written consent
# from Blue Clover Design.
#

FROM debian:9
MAINTAINER Blue Clover Devices DevTeam

# Setup environment
ENV DEBIAN_FRONTEND noninteractive
ENV TERM=xterm
ENV PATH="/usr/local/elixir/bin:${PATH}"

#Setup locale
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y locales

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

ENV LANG=C.UTF-8

# The container has no package lists, so need to update first
RUN set -xe \
  && apt-get update \
  && apt-get -y install \
	git \
	curl \
	build-essential \
	gperf \
	bison \
	flex \
	texinfo \
	wget \
	gawk \
	libtool \
	automake \
	libncurses5-dev \
	help2man \
	ca-certificates \
	unzip \
  cpio \
  python \
  bc \
  subversion \
  adwaita-icon-theme at-spi2-core dbus dconf-gsettings-backend dconf-service \
  emacsen-common fontconfig fontconfig-config \
  fonts-dejavu-core glib-networking glib-networking-common \
  glib-networking-services gnome-icon-theme gsettings-desktop-schemas \
  gtk-update-icon-cache hicolor-icon-theme libapparmor1 libatk-bridge2.0-0 \
  libatk1.0-0 libatk1.0-data libatspi2.0-0 libavahi-client3 \
  libavahi-common-data libavahi-common3 libcairo-gobject2 libcairo2 libcolord2 \
  libcroco3 libcups2 libdatrie1 libdbus-1-3 libdconf1 libdrm-amdgpu1 \
  libdrm-intel1 libdrm-nouveau2 libdrm-radeon1 libdrm2 libegl1-mesa libepoxy0 \
  libfontconfig1 libfreetype6 libgail-common libgail18 libgbm1 \
  libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-common libgl1-mesa-dri libgl1-mesa-glx \
  libglapi-mesa libgraphite2-3 libgtk-3-0 libgtk-3-bin libgtk-3-common \
  libgtk2.0-0 libgtk2.0-bin libgtk2.0-common libharfbuzz0b libice6 libjbig0 \
  libjpeg62-turbo libjson-glib-1.0-0 libjson-glib-1.0-common liblcms2-2 \
  libllvm3.9 libnotify4 libpango-1.0-0 libpangocairo-1.0-0 libpangoft2-1.0-0 \
  libpciaccess0 libpixman-1-0 libpng16-16 libproxy1v5 librest-0.7-0 librsvg2-2 \
  librsvg2-common libsctp1 libsensors4 libsm6 libsoup-gnome2.4-1 libsoup2.4-1 \
  libthai-data libthai0 libtiff5 libtxc-dxtn-s2tc libwayland-client0 \
  libwayland-cursor0 libwayland-egl1-mesa libwayland-server0 libwxbase3.0-0v5 \
  libwxgtk3.0-0v5 libx11-6 libx11-data libx11-xcb1 libxau6 libxcb-dri2-0 \
  libxcb-dri3-0 libxcb-glx0 libxcb-present0 libxcb-render0 libxcb-shm0 \
  libxcb-sync1 libxcb-xfixes0 libxcb1 libxcomposite1 libxcursor1 libxdamage1 \
  libxdmcp6 libxext6 libxfixes3 libxi6 libxinerama1 libxkbcommon0 libxrandr2 \
  libxrender1 libxshmfence1 libxtst6 libxxf86vm1 notification-daemon \
  shared-mime-info x11-common xkb-data procps\
  fakeroot \
	&& rm -rf /var/lib/apt/lists/*

ENV ERLANG_OTP_VERSION=22.3.3-1
ENV ERLANG_PKG="esl-erlang_${ERLANG_OTP_VERSION}~debian~stretch_amd64.deb"
ENV ERLANG_URL="https://packages.erlang-solutions.com/erlang/debian/pool/${ERLANG_PKG}"
ENV ELIXIR_VERSION=1.10.3-otp-22


# Install Erlang
RUN echo ${ERLANG_URL}
RUN curl -o "/tmp/${ERLANG_PKG}" ${ERLANG_URL} \
  && dpkg -i "/tmp/${ERLANG_PKG}" \
  && apt-get update \
  && apt-get -y install \
    "esl-erlang=1:${ERLANG_OTP_VERSION}"

#Install Elixir
RUN wget https://repo.hex.pm/builds/elixir/v$ELIXIR_VERSION.zip && \
      unzip -d /usr/local/elixir v$ELIXIR_VERSION.zip

#Create Work Directory
RUN mkdir -p /nerves-system

#Set Working Directory
WORKDIR /nerves-system

# COPY
COPY . /nerves-system

RUN mkdir -p /root/local
RUN mkdir -p /root/empty

