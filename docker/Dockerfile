FROM alpine-glibc
RUN apk -U add openssl make bash perl file gcc g++ gawk bzip2 python2 ncurses-dev  zlib-dev git wget \
	&& rm /var/cache/apk/APKINDEX*
ENV VERSION 17.01.2
ARG PLATFORM
ARG ROUTER
ENV PACKAGE lede-imagebuilder-${VERSION}-${PLATFORM}-generic.Linux-x86_64.tar.xz
RUN wget https://downloads.lede-project.org/releases/${VERSION}/targets/${PLATFORM}/generic/${PACKAGE}
RUN mkdir /openwrt \
	&& tar -C /openwrt --strip-components=1 -xf /lede-imagebuilder*.tar.*
ADD routers /routers
RUN mv /routers/${ROUTER}/packages/* /openwrt/packages; true
ENTRYPOINT ["make", "-C", "/openwrt"]
