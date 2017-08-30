#!/bin/bash

NDK=~/adt-bundle/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-23/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
PREFIX=$(pwd)/android/$CPU
ADDI_CFLAGS="-marm"

CPU=arm
build_one

function build_one
{
./configure \
--prefix=$PREFIX \
--enable-shared \
--disable-static \
--disable-doc \
--disable-ffmpeg \
--disable-ffplay \
--disable-ffprobe \
--disable-ffserver \
# 设备
#--disable-avdevice \
# 允许使用GPL code
--enable-gpl \
#postproc
--enable-postproc \
--disable-doc \
--disable-symver \
--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
--target-os=linux \
--arch=arm \
--enable-cross-compile \
--sysroot=$SYSROOT \
--extra-cflags="-Os -fpic $ADDI_CFLAGS" \
--extra-ldflags="$ADDI_LDFLAGS" \
$ADDITIONAL_CONFIGURE_FLAG
make clean
make
make install
}

