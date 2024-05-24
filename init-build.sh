#!/bin/bash

cd /home/yocto/poky
nano build/conf/bblayers.conf

# BBLAYERS ?= " \
#   /home/yocto/poky/meta \
#   /home/yocto/poky/meta-poky \
#   /home/yocto/poky/meta-yocto-bsp \
#   /home/yocto/poky/meta-ti \
#   /home/yocto/poky/meta-openembedded/meta-oe \
# "

nano build/conf/local.conf
# MACHINE ?= "am335x-evm"
# TUNE_FEATURES ?= "arm armv7a vfp neon"

# DISTRO ?= "poky"
# PACKAGE_CLASSES ?= "package_deb package_rpm"

# EXTRA_IMAGE_FEATURES ?= "debug-tweaks tools-sdk tools-debug"
# IMAGE_INSTALL_append = " openssh-sftp-server"

# DL_DIR ?= "${TOPDIR}/downloads"
# SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

# BB_DISKMON_DIRS ??= "\
#     STOPTASKS,${TMPDIR},1G,100K \
#     STOPTASKS,${DL_DIR},1G,100K \
#     STOPTASKS,${SSTATE_DIR},1G,100K \
#     STOPTASKS,/tmp,100M,100K \
#     HALT,${TMPDIR},100M,1K \
#     HALT,${DL_DIR},100M,1K \
#     HALT,${SSTATE_DIR},100M,1K \
#     HALT,/tmp,10M,1K"


mkdir -p /home/yocto/poky/meta-ti/conf
nano /home/yocto/poky/meta-ti/conf/layer.conf

# We have a conf and classes directory, add to BBPATH
BBPATH .= ":${LAYERDIR}"

# We have recipes-* directories, add to BBFILES
BBFILES += "${LAYERDIR}/recipes-*/*/*.bb \
            ${LAYERDIR}/recipes-*/*/*.bbappend"

BBFILE_COLLECTIONS += "meta-ti"
BBFILE_PATTERN_meta-ti := "^${LAYERDIR}/"
BBFILE_PRIORITY_meta-ti = "6"

# This should only be incremented on significant changes that will
# cause compatibility issues with other layers
LAYERVERSION_meta-ti = "1"

# Specify the compatible Yocto Project release series
LAYERSERIES_COMPAT_meta-ti = "zeus dunfell gatesgarth hardknott honister kirkstone langdale mickledore"

# Dependencies
LAYERDEPENDS_meta-ti = "core openembedded-layer"

bitbake -c cleanall core-image-minimal

bitbake core-image-minimal

# sudo dd if=core-image-minimal-am335x-evm.sdimg of=/dev/sdX bs=4M


MACHINE ?= "am335x-evm"
TUNE_FEATURES ?= "arm armv7a vfp neon"

DISTRO ?= "poky"
PACKAGE_CLASSES ?= "package_deb package_rpm"

EXTRA_IMAGE_FEATURES ?= "debug-tweaks tools-sdk tools-debug"
IMAGE_INSTALL:append = " openssh-sftp-server"

DL_DIR ?= "${TOPDIR}/downloads"
SSTATE_DIR ?= "${TOPDIR}/sstate-cache"

BB_DISKMON_DIRS ??= "\
    STOPTASKS,${TMPDIR},1G,100K \
    STOPTASKS,${DL_DIR},1G,100K \
    STOPTASKS,${SSTATE_DIR},1G,100K \
    STOPTASKS,/tmp,100M,100K \
    HALT,${TMPDIR},100M,1K \
    HALT,${DL_DIR},100M,1K \
    HALT,${SSTATE_DIR},100M,1K \
    HALT,/tmp,10M,1K"

CONF_VERSION = "2"
