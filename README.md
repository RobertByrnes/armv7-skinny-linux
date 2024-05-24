# armv7-skinny-linux

## Chip Identifiers
- `OVK17 D9PSL` - This is a DRAM chip from Micron Technology used for memory storage in various electronic devices.
- `ETRX357HR` - The ETRX357HR is a Zigbee transceiver module from Silicon Labs. It is based on the EM357 SoC and integrates an ARM Cortex-M3 processor. This module is used for wireless communication in Zigbee networks, offering robust performance and RF capabilities.
- `AM3352BZCZ60` - (armv7-a architecture) This is a Sitara ARM Cortex-A8 microprocessor from Texas Instruments. It is designed for industrial applications with features like a 3D graphics accelerator, multiple connectivity interfaces (Ethernet, CAN, USB), and real-time clock capabilities​.
- `IFA17 JY976` - This identifier did not return specific information from available sources. Consulting the device's manufacturer documentation or support may be necessary for accurate details.
- `WL18MODGI` - The WL18MODGI is a WiLink 8 module from Texas Instruments that integrates Wi-Fi and Bluetooth functionalities, commonly used in IoT devices for wireless communication.
- `TPS65217C TI 871 AEJZ G4` - This is a power management IC from Texas Instruments designed to manage the power requirements of portable, battery-powered devices, including multiple DC-DC converters, linear regulators, and a battery charger.

## Docker build commands
- `docker build -t yocto-armv7-a-builder -f Dockerfile.yocto .` - This command builds a Docker image named `yocto-armv7-a-builder` using the `Dockerfile.yocto` file.   
- `docker run --cpus 4 -itd --rm --name yocto-armv7-a-builder yocto-armv7-a-builder` - This command runs a Docker container named `yocto-armv7-a-builder` from the `yocto-armv7-a-builder` image with 4 CPUs.
- `docker exec -it yocto-armv7-a-builder bash` - This command opens a bash shell in the running `yocto-armv7-a-builder` container.
- `docker cp local.conf yocto-armv7-a-builder:/home/yocto/poky/build/conf/local
.conf` - This command copies the `local.conf` file from the host machine to the `yocto-armv7-a-builder` container.