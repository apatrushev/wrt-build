- install alpine-glibc image
```
make alpine
```
- create config in routers folder, see examples. minimal one:
```
mkdir routers/myro
```
config `routers/myro/config`
```
PLATFORM=ar71xx
PROFILE=tl-mr3040-v1
PACKAGES="kmod-usb-storage kmod-fs-exfat block-mount kmod-fs-f2fs mkf2fs f2fsck"
TARGET=/openwrt/bin/targets/$PLATFORM/generic/lede-17.01.2-$PLATFORM-generic-$PROFILE-squashfs-sysupgrade.bin
```
- build
```
./build.sh myro
```
