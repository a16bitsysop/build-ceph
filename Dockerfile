FROM ghcr.io/a16bitsysop/build-ceph:part AS buildaport
ARG NME
ENV APORT=ceph
ENV REPO=community

RUN V=$(cat APKBUILD | grep "pkgver=" | cut -d'=' -f2) && cd src/${APORT}-${V} \
&& make -C build
#&& abuild -K -P /tmp/pkg package
