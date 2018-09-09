clean:
	rm "*sysupgrade.bin"

# ar71xx mpc85xx
wrt.build.%:
	docker build -t wrt.build \
	--build-arg PLATFORM=$(subst wrt.build.,,$@) \
	--build-arg ROUTER=$(ROUTER) \
	-f docker/Dockerfile \
	.

shell:
	docker run -ti --entrypoint /bin/sh wrt.build

alpine:
	make -C alpine-glibc install
