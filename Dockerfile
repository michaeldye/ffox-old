FROM ubuntu:trusty-20180712

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java

RUN echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
RUN echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections

# TODO: try to slim this down
RUN apt-get update && apt-get install -y oracle-java8-installer curl libc6 libncurses5 libstdc++6 libxt6 libgtk2.0-0 libdbus-glib-1-2 libdbus-1-3 libasound2 libxft2 libxmu6 libxv1 libxrender1 libcanberra-gtk-module libgtk-3-0 libx11-xcb1

RUN curl -L https://sourceforge.net/projects/ubuntuzilla/files/mozilla/apt/pool/main/f/firefox-mozilla-build/firefox-mozilla-build_51.0-0ubuntu1_amd64.deb/download  > /tmp/firefox-mozilla-build_51.0-0ubuntu1_amd64.deb && dpkg -i /tmp/firefox-mozilla-build_51.0-0ubuntu1_amd64.deb

COPY mozilla-home /root/.mozilla
RUN mkdir -p /root/.mozilla/plugins/ && ln -s /usr/lib/jvm/java-8-oracle/jre/lib/amd64/libnpjp2.so  /root/.mozilla/plugins/libnpjp2.so

WORKDIR /opt/firefox
CMD ["firefox"]
