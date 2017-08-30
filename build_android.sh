
#!/bin/bash  
#NDK=/home/dennis/android-ndk-r9d  
#SYSROOT=$NDK/platforms/android-9/arch-arm/  
#TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64  
#  
#function build_one  
#{  
#./configure \  
#    --prefix=$PREFIX \  
#    --enable-shared \  
#    --disable-static \  
#    --disable-doc \  
#    --disable-ffserver \  
#    --enable-cross-compile \  
#    --cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \  
#    --target-os=linux \  
#    --arch=arm \  
#    --sysroot=$SYSROOT \  
#    --extra-cflags="-Os -fpic $ADDI_CFLAGS" \  
#    --extra-ldflags="$ADDI_LDFLAGS" \
#    $ADDITIONAL_CONFIGURE_FLAG
#}  
#CPU=arm
#PREFIX=$(pwd)/android/$CPU
#ADDI_CFLAGS="-marm"
#build_one

#./configure \
#--target-os=linux \
#--prefix=$PREFIX \
#--enable-cross-compile \
#--enable-runtime-cpudetect \
#--disable-asm \
#--arch=arm \
#--cc=$TOOLCHAIN/bin/arm-linux-androideabi-gcc \
#--cross-prefix=$TOOLCHAIN/bin/arm-linux-androideabi- \
#--disable-stripping \
#--nm=$TOOLCHAIN/bin/arm-linux-androideabi-nm \
#--sysroot=$SYSROOT \
#--enable-gpl \
#--enable-shared \
#--disable-static \
#--enable-small \
#--disable-ffprobe \
#--disable-ffplay \
#--disable-ffmpeg \
#--disable-ffserver \
#--disable-debug \
#--extra-cflags="-fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a"

NDK=/home/zhy/adt-bundle/sdk/ndk-bundle
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

