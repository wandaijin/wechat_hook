FROM debian:bullseye-slim

# change mirror, speed up downloading
RUN apt-get update && \
    apt-get install -y python3-pip && \
    pip install apt-mirror-updater

# select a mirror
RUN apt-mirror-updater -c "https://mirrors.ustc.edu.cn/debian/"

# install x11 related tool
RUN apt-get update && \
    apt-get install -y git net-tools curl wget supervisor fluxbox xterm x11vnc novnc xvfb xdotool gnupg2 software-properties-common

# install wine
RUN dpkg --add-architecture i386 && \
    mkdir -pm 755 /etc/apt/keyrings && \
    wget -O /etc/apt/keyrings/winehq-archive.key https://dl.winehq.org/wine-builds/winehq.key && \
    wget -NP /etc/apt/sources.list.d/ https://dl.winehq.org/wine-builds/debian/dists/bullseye/winehq-bullseye.sources && \
    apt-get update && apt-get -y install --install-recommends winehq-stable

# make vnc password 
RUN mkdir ~/.vnc && x11vnc -storepasswd your_vnc_password ~/.vnc/passwd

# add an user
RUN apt-get install -y sudo && \
    useradd -m app && \
    usermod -aG sudo app && \
    echo 'app ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# add local font 
RUN apt-get install -y ttf-wqy-microhei locales procps vim && \
    rm -rf /var/lib/apt/lists/* && \
    sed -ie 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen && \
    locale-gen

# set screen size
ENV DISPLAY_WIDTH=1280 DISPLAY_HEIGHT=720 DISPLAY=:0.0 
# set local language
ENV LANG=zh_CN.UTF-8 LANGUAGE=zh_CN.UTF-8 LC_ALL=zh_CN.UTF-8 
# set wine
ENV WINEPREFIX=/home/app/.wine

USER app
WORKDIR /home/app
#web vnc port
EXPOSE 5900
#http and web socket
EXPOSE 5555


# init dir
RUN wineboot -u
COPY /root/scripts/ /scripts/
COPY /root/etc/supervisor/conf.d/ /etc/supervisor/conf.d/


# install binary on GUI
RUN bash -c 'nohup /scripts/run-gui.sh 2>&1 &' && sleep 5 && /scripts/run-payloads.sh

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]