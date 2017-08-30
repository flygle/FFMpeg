#下面这个脚本可以生成一个裁剪功能后，包含libx264和libfaac支持的类库。

NDK=/home/zhy/adt-bundle/sdk/ndk-bundle
SYSROOT=$NDK/platforms/android-23/arch-arm/
TOOLCHAIN=$NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/linux-x86_64
PREFIX=$(pwd)/264fflib
ADDI_CFLAGS="-marm"

CPU=arm
build_one

function build_one
{
  ./configure --target-os=linux --prefix=$PREFIX \  
--enable-cross-compile \  
--enable-runtime-cpudetect \  
--disable-asm \  
--arch=arm \  
--cc=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-gcc \  
--cross-prefix=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi- \  
--disable-stripping \  
--nm=$PREBUILT/linux-x86_64/bin/arm-linux-androideabi-nm \  
--sysroot=$PLATFORM \  
--enable-gpl --enable-shared --disable-static --enable-nonfree --enable-version3 --enable-small --disable-vda --disable-iconv \  
--disable-encoders --enable-libx264 --enable-libfaac --enable-encoder=libx264 --enable-encoder=libfaac \  
--disable-muxers --enable-muxer=mov --enable-muxer=ipod --enable-muxer=psp --enable-muxer=mp4 --enable-muxer=avi \  
--disable-decoders --enable-decoder=aac --enable-decoder=aac_latm --enable-decoder=h264 --enable-decoder=mpeg4 \  
--disable-demuxers --enable-demuxer=h264 --enable-demuxer=avi --enable-demuxer=mpc --enable-demuxer=mov \  
--disable-parsers --enable-parser=aac --enable-parser=ac3 --enable-parser=h264 \  
--disable-protocols --enable-protocol=file \  
--disable-bsfs --enable-bsf=aac_adtstoasc --enable-bsf=h264_mp4toannexb \  
--disable-indevs --enable-zlib \  
--disable-outdevs --disable-ffprobe --disable-ffplay --disable-ffmpeg --disable-ffserver --disable-debug \  
--extra-cflags="-I android-lib/include -fPIC -DANDROID -D__thumb__ -mthumb -Wfatal-errors -Wno-deprecated -mfloat-abi=softfp -marm -march=armv7-a" \  
--extra-ldflags="-L android-lib/lib"  

}
build_one  
make clean
make
make install

