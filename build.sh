#!/usr/bin/env bash
[ -z "$1" ] && {
	echo 'provide router name'
	exit 1
}

CONFIG="routers/$1/config"
[ -e "${CONFIG}" ] || {
	echo 'config file not found' ${CONFIG}
	exit 1
}

. ${CONFIG}
make wrt.build.${PLATFORM} ROUTER=uchi
docker run -ti wrt.build image PROFILE=${PROFILE} "PACKAGES=${PACKAGES}"
docker cp `docker ps -lq`:${TARGET} .
