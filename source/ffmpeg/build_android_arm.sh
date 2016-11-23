#!/bin/bash
export TMPDIR=D:/cygwin64/tmp
NDK=/cygdrive/d/android-ndk-r9
SYSROOT=D:/android-ndk-r9/platforms/android-9/arch-arm/
TOOLCHAIN=D:/android-ndk-r9/toolchains/arm-linux-androideabi-4.6/prebuilt/windows-x86_64

CPU=arm
PREFIX=/home/ffmpeg_shared_compile/arm/
ADDI_CFLAGS="-marm"

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
--disable-doc \
--disable-symver \
--enable-small \
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

build_one
