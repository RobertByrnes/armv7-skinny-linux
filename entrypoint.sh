#!/bin/bash

# Source the oe-init-build-env script to set up the environment
cd /home/yocto/poky
. ./oe-init-build-env /home/yocto/poky/build

# Check if the build directory was created
if [ ! -d /home/yocto/poky/build ]; then
    echo "Error: The build directory (/home/yocto/poky/build) was not created!"
    exit 1
fi

# Backup the original .conf files if they exist
if [ -f /home/yocto/poky/build/conf/local.conf ]; then
    mv /home/yocto/poky/build/conf/local.conf /home/yocto/poky/build/conf/local.conf.bkp
fi
if [ -f /home/yocto/poky/build/conf/bblayers.conf ]; then
    mv /home/yocto/poky/build/conf/bblayers.conf /home/yocto/poky/build/conf/bblayers.conf.bkp
fi

# Copy the new .conf files to the build directory
cp /home/yocto/confs/local.conf /home/yocto/poky/build/conf/local.conf
cp /home/yocto/confs/bblayers.conf /home/yocto/poky/build/conf/bblayers.conf

# Clean up the confs directory
rm -rf /home/yocto/confs

# Keep the container running by executing the passed command or a shell
exec "$@"
