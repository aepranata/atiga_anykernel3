# AnyKernel3 Ramdisk Mod Script
# osm0sis @ xda-developers

## AnyKernel setup
# begin properties
properties() { '
kernel.string=A³ Kernel Installer
do.devicecheck=1
do.modules=0
do.systemless=1
do.cleanup=1
do.cleanuponabort=0
device.name1=m20lte
supported.versions=10-13
supported.patchlevels=
'; } # end properties

PARTITION=boot

# shell variables
block=auto;
is_slot_device=0;
ramdisk_compression=auto;
patch_vbmeta_flag=auto;


## AnyKernel methods (DO NOT CHANGE)
# import patching functions/variables - see for reference
. tools/ak3-core.sh;

# Backup the partition
if dd if=${block} of=/sdcard/previous-${PARTITION}.img; then
  ui_print ""
  ui_print "Your previous ${PARTITION} image has been saved to: /sdcard/previous-${PARTITION}.img"
  ui_print ""
fi

## AnyKernel file attributes
# set permissions/ownership for included ramdisk files
set_perm_recursive 0 0 755 644 $ramdisk/*;
set_perm_recursive 0 0 750 750 $ramdisk/init* $ramdisk/sbin;


## AnyKernel boot install
dump_boot;

write_boot;
## end boot install
