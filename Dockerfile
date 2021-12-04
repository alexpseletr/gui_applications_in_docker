FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
ENV TZ="America/Sao_Paulo"
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone



RUN set -eux; \
  apt-get update \
  && apt-get upgrade -y \
  && apt-get install -y \
  locales \
  build-essential \
  autoconf \
  bison \
  autotools-dev \
  automake \
  libexpat1-dev \
  libtool \
  libssl1.0.0 \
  libreadline5 \
  libaio1 \
  libx11-dev \
  xorg-dev \
  libpangocairo-1.0  \
  libcairo-dev \
  libpango1.0 \
  libnss3 \
  libnspr4 \
  libgconf2-dev \
  libasound-dev \
  libatk1.0 \
  cups \
  libcups2-dev \
  libgconf-2-4  \
  libpq-dev \
  libdbd-pg-perl \
  libhidapi-dev \
  python3 \
  libusb-1.0-0-dev \
  keyboard-configuration \
  pluma

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8 
  
  
  RUN  apt-get install -y \
  python3-pip \
  python-pip \
  curl \
  wget \
  xorgxrdp \
  xrdp \
  xfce4 \
  xfce4-goodies \
  xfce4-whiskermenu-plugin \
  menulibre \
  apt-utils \
  git
 
	
RUN python3 -m pip install flake8  \
  && pip install --upgrade pip \
  && pip install -U --force-reinstall setuptools pyflakes mccabe pycodestyle  \
  && pip install -U --force-reinstall flake8 --ignore-installed  \
  && curl -LO http://mirrors.kernel.org/ubuntu/pool/main/libp/libpng/libpng12-0_1.2.54-1ubuntu1.1_amd64.deb \
  && dpkg -i ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb \
  && rm -f ./libpng12-0_1.2.54-1ubuntu1.1_amd64.deb \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs   tightvncserver
  
RUN useradd alex  -rm -d /home/alex -s /bin/bash -g root -G sudo -u 1000 
ENV USER alex
USER alex
WORKDIR /home/alex


EXPOSE 5901
EXPOSE 8080
EXPOSE 9595



