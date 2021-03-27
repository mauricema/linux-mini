#!/bin/bash

echo Building initramfs ...
if [ ! -d 'initfs' ]; then
	mkdir initfs
	cd initfs
	wget http://landley.net/toybox/downloads/binaries/mkroot/0.8.4/x86_64.tgz
	tar xzvf x86_64.tgz
	cp ../misc/init x86_64/fs/init
	cd x86_64/fs
	find . | cpio -o -H newc | gzip > ../../../initrd
	cd ../../..
fi

if [ -d 'linux' ]; then
	echo Checking out linux kernel ...
	cd  ./linux
	git checkout v5.11 -f
else
	echo Cloning linux kernel ...
	git clone --depth 1 --branch v5.11  https://github.com/torvalds/linux.git linux
	cd  ./linux
fi

echo Compiling kernel ...
cp ../misc/mini_config .config
make ARCH=x86_64 "KCFLAGS=-mno-movbe" bzImage -j 8
cd ..
cp linux/arch/x86/boot/bzImage vmlinuz

cp misc/config.cfg config.cfg

echo Done !
