# Mini Linux for SBL QEMU #

This repo contains scripts to build a mini kernel and initramfs to run on Slim Bootloader QEMU target.

The kernel is based on [Linux kernel v5.11](https://www.kernel.org/)

The initramfs is based on [toybox 0.8.4](http://landley.net/toybox "toybox") 


## Build Instructions ##
To build required images, just run:


      ./mk.sh


It will generate:

     - Kernel bz image: vmlinuz
      
     - Init ramdisk filesystem: initrd
     
     - Slim Bootloader boot config file: config.cfg
    

These files can be used for Slim Bootloader QEMU target Linux boot. 
Please refer to [this](https://slimbootloader.github.io/supported-hardware/qemu.html#boot-to-yocto-on-qemu-emulator) on how to boot Linux on QEMU with Slim Bootloader.




