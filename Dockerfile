FROM ghcr.io/a16bitsysop/build-ceph:part AS buildaport
ARG NME
ENV APORT=ceph
ENV REPO=community

RUN abuild -K build \
&& abuild -K -P /tmp/pkg package
