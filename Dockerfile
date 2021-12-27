FROM ghcr.io/a16bitsysop/build-ceph:part AS buildaport
ARG NME
ARG CORES
ENV APORT=ceph
ENV REPO=community

RUN V=$(cat APKBUILD | grep "pkgver=" | cut -d'=' -f2) && cd src/${APORT}-${V} \
&& make -j ${CORES} -C build
#&& abuild -K -P /tmp/pkg package
