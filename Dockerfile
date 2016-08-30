FROM base/archlinux
MAINTAINER Max Gonzih <gonzih at gmail dot com>

RUN pacman-key --init \
    && pacman-key --populate archlinux \
    && pacman -Sy archlinux-keyring --noconfirm --noprogressbar \
    && pacman -Suy base base-devel git sudo unzip --noconfirm --noprogressbar \
    && update-ca-trust

RUN pacman-db-upgrade
RUN useradd build
RUN echo "build ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN echo 'MAKEFLAGS="-j9"' >> /etc/makepkg.conf

USER build
RUN git clone https://aur.archlinux.org/ioquake3-git.git /tmp/ioquake3
RUN cd /tmp/ioquake3 && makepkg -si --noconfirm

ADD baseq3/pak0.pk3 /opt/quake3/baseq3/pak0.pk3
ADD server.cfg /opt/quake3/baseq3/server.cfg

USER root

RUN cd /opt/quake3 \
    && curl http://osp.dget.cc/orangesmoothie/downloads/osp-Quake3-1.03a_full.zip > osp-full.zip \
    && unzip osp-full.zip \
    && rm osp-full.zip

EXPOSE 27960

CMD ["/opt/quake3/ioq3ded", "+set", "dedicated", "2", "+set", "fs_game", "osp", "+set", "sv_allowDownload", "1", "+set", "sv_dlURL", "", "+set", "com_hunkmegs", "64", "+exec", "server.cfg"]
