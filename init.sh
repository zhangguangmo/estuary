#!/bin/bash
#author: justin.zhao
#date: March 2, 2015

TOOLCHAIN_DIR=toolchain
DISTRO_DIR=distro
GCC32=gcc-linaro-arm-linux-gnueabihf-4.9-2014.09_linux.tar.xz
GCC64=gcc-linaro-aarch64-linux-gnu-4.9-2014.09_linux.tar.xz

#fetch toolchains
if [ ! -d "$TOOLCHAIN_DIR" ]; then
mkdir -p "$TOOLCHAIN_DIR" 2> /dev/null

curl http://releases.linaro.org/14.09/components/toolchain/binaries/$GCC32 > ./$TOOLCHAIN_DIR/$GCC32
curl http://releases.linaro.org/14.09/components/toolchain/binaries/$GCC64 > ./$TOOLCHAIN_DIR/$GCC64
fi

#Install some dependencies about grub for ubuntu/debian
sudo apt-get build-dep grub -y
sudo apt-get install build-essential automake -y

#Install some dependencies about uefi for ubuntu/debian
sudo apt-get install uuid-dev build-essential gcc-arm-linux-gnueabi
sudo apt-get install gcc-arm-linux-gnueabihf

#Fetch distribution OS
#if [ ! -d "$DISTRO_DIR" ]; then
#mkdir -p "$DISTRO_DIR" 2> /dev/null

#OpenEmbedded:
#curl http://releases.linaro.org/14.06/openembedded/aarch64/vexpress64-openembedded_minimal-armv8-gcc-4.8_20140623-668.img.gz > ./$DISTRO_DIR/vexpress64-openembedded_minimal-armv8-gcc-4.8_20140623-668.img.gz

#Debian:
#curl http://people.debian.org/~wookey/bootstrap/rootfs/debian-unstable-arm64.tar.gz > ./$DISTRO_DIR/debian-unstable-arm64.tar.gz

#Ubuntu:
#curl http://cdimage.ubuntu.com/ubuntu-core/releases/14.04/release/ubuntu-core-14.04-core-arm64.tar.gz > ./$DISTRO_DIR/Ubuntu-core-14.04-core-arm64.tar.gz

#OpenSuse:
#wget http://download.opensuse.org/ports/aarch64/distribution/13.1/appliances/openSUSE-13.1-ARM-JeOS.aarch64-rootfs.aarch64-1.12.1-Build37.1.tbz 
#chmod 777 openSUSE-13.1-ARM-JeOS.aarch64-rootfs.aarch64-1.12.1-Build37.1.tbz
#mv openSUSE-13.1-ARM-JeOS.aarch64-rootfs.aarch64-1.12.1-Build37.1.tbz ./$DISTRO_DIR/OpenSuse-13.1-ARM-JeOS.aarch64-rootfs.aarch64-1.12.1-Build37.1.tbz
#Fedora:
#curl http://dmarlin.fedorapeople.org/fedora-arm/aarch64/F21-20140407-foundation-v8.tar.xz > ./$DISTRO_DIR/F21-20140407-foundation-v8.tar.xz
#fi
