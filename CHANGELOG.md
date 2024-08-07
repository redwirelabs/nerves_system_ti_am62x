# Changelog

## v0.2.0

This release is a major version update to TI's 10.00.06 board support package.
There are now device trees for other AM62 platforms, like [Toradex Verdin](https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62)
and [Beagle Play](https://www.beagleboard.org/boards/beagleplay).
This Nerves system doesn't support those platforms automatically _yet_, but you
can change this system's `BR2_LINUX_KERNEL_INTREE_DTS_NAME` in `nerves_defconfig`
to the device tree you would like to use.

- Supported hardware
   - TI [SK-AM62B-P1](https://www.ti.com/tool/SK-AM62B-P1)

- Validated peripherals
   - UART5
   - I2C0, I2C2
   - GPIO (use [circuits_gpio v2](https://hex.pm/packages/circuits_gpio))
   - ETH0, ETH1
   - Heartbeat LED
   - OSPI flash
   - Board ID EEPROM
   - CPU & memory temperature sensors
   - User header load switches

- Dependencies
   - TI BSP 10.00.06
   - [Erlang/OTP 26.2.5](https://erlang.org/download/OTP-26.2.5.README)

## v0.1.0

This is a preliminary release based on TI's board support package 09.02.00.010.
The hardware boots Nerves and some of the peripherals are available. If using
GPIO, refer to the schematic `PROC142(A002)_SCH_With_Design_Updates..Notes_V1.0.pdf`
in SK-AM62B-P1 Design Package File [spar001a.zip](https://www.ti.com/lit/zip/spar001). The signal names on the
schematic can be used to configure the GPIO, as these are not exported to sysfs.

SPI does not seem to work even though it appears to be configured in the
device tree.

- Supported hardware
   - TI [SK-AM62B-P1](https://www.ti.com/tool/SK-AM62B-P1)

- Validated peripherals
   - UART5
   - I2C0, I2C2
   - GPIO (use [circuits_gpio v2](https://hex.pm/packages/circuits_gpio))
   - ETH0, ETH1
   - Heartbeat LED
   - OSPI flash
   - Board ID EEPROM
   - CPU & memory temperature sensors
   - User header load switches

- Dependencies
   - TI BSP 09.02.00.010
   - [Erlang/OTP 26.2.5](https://erlang.org/download/OTP-26.2.5.README)
   - [Buildroot 2024.02.2](https://lore.kernel.org/buildroot/874jbaxb7g.fsf@dell.be.48ers.dk/)
