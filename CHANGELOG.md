# Changelog

## v1.13.0

This release updates to [Buildroot
2020.08](http://lists.busybox.net/pipermail/buildroot/2020-September/290797.html) and OTP 23.1.1.

* Updated dependencies
  * [nerves_system_br: bump to v1.13.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.13.2)
  * [Erlang/OTP 23.1.1](https://erlang.org/download/OTP-23.1.1.README)
  * [erlinit 1.8.0](https://github.com/nerves-project/erlinit/releases/tag/v1.8.0)
  * [nerves 1.7.0](https://github.com/nerves-project/nerves/releases/tag/v1.7.0)

* New features
  * Added support for updating the root filesystem using firmware patches.
    See the [firmware patch docs](https://hexdocs.pm/nerves/experimental-features.html#content) for more information.

## v1.12.2

This release updates to [Buildroot
2020.05.1](http://lists.busybox.net/pipermail/buildroot/2020-July/287824.html)
and OTP 23.0.3 which are both bug fix releases.

IMPORTANT: If you have made a custom `fwup.conf` file, then you'll need to
replace references to `start4.elf` with `start.elf` and references to
`fixup4.dat` with `fixup.dat`. See [commit
e21ad76](https://github.com/nerves-project/nerves_system_rpi4/commit/e21ad76b817583f44afc31935581f7df00aabb35)
for how this change was made here.

* Updated dependencies
  * [nerves_system_br: bump to v1.12.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.12.4)
  * [Erlang/OTP 23.0.3](https://erlang.org/download/OTP-23.0.3.README)
  * [nerves_heart v0.3.0](https://github.com/nerves-project/nerves_heart/releases/tag/v0.3.0)

* New features
  * The `/data` directory now exists for storing application-specific data. It
    is currently a symlink to `/root`. Using `/data` will eventually be
    encouraged over `/root` even though currently there is no advantage. This
    change makes it possible to start migrating paths in applications and
    libraries.

* Fixes
  * Fixed old references to the `-Os` compiler flag. All C/C++ code will default
    to using `-O2` now.

## v1.12.1

* Fixes
  * Remove `nerves_system_linter` from hex package. This fixes mix dependency
    errors in projects that reference systems with different
    `nerves_system_linter` dependency specs.

## v1.12.0

This release updates the system to use Buildroot 2020.05 and Erlang/OTP 23.
Please see the respective release notes for updates and deprecations in both
projects for changes that may affect your application.

* New features
  * Support the Raspberry Pi Sense HAT's joystick
  * Enable WiFi mesh support in the 802.11 stack

* Updated dependencies
  * [nerves_system_br v1.12.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.12.0)
  * [Erlang/OTP 23.0.2](https://erlang.org/download/OTP-23.0.2.README)
  * [Linux 4.19.118 (Raspberry Pi 1.2020601 tag)](https://github.com/raspberrypi/linux/tree/raspberrypi-kernel_1.20200601-1)
  * [Raspberry Pi firmware 1.2020601](https://github.com/raspberrypi/firmware/tree/1.20200601)

## v1.11.3

* Updated dependencies
  * [nerves_system_br v1.11.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.11.4)
  * Erlang 22.3.4.1
  * fwup 1.7.0

## v1.11.2

* Updated dependencies
  * [nerves_system_br v1.11.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.11.2)
  * Erlang 22.3.1
  * erlinit 1.7.0 - tty initialization support
  * fwup 1.6.0 - xdelta3/VCDIFF patch support
  * Enable unixodbc so that Erlang's odbc application can be used in projects

## v1.11.1

This release updates the Linux configuration to match changes in the latest
Raspberry Pi kernel configuration for the Raspberry Pi 4. If you have made
a custom system, the following kernel configuration changes may affect you:

```
+CONFIG_CPUFREQ_DT=y
+CONFIG_ARM_RASPBERRYPI_CPUFREQ=y
+# CONFIG_ARM_BCM2835_CPUFREQ is not set
+CONFIG_RPIVID_MEM=m
+CONFIG_REGULATOR_FIXED_VOLTAGE=y
+CONFIG_DRM_V3D=m
+CONFIG_CLK_RASPBERRYPI=y
```

* Bug fixes
  * Fixed regulator kernel configuration setting that prevented booting
    sometimes (this was a "not sure how this ever worked" kind of bug)

## v1.11.0

This release updates Buildroot to 2020.02 and upgrades gcc from 8.3 to 9.2.
While this is a minor version bump due to the Buildroot release update, barring
advanced usage of Nerves, this is a straightforward update from v1.10.2.

* Updated dependencies
  * [nerves_system_br v1.11.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.11.0)
  * linux 4.19.97 (raspberrypi-kernel_1.20200212-1 tag)
  * Erlang 22.2.8

## v1.10.2

* Updated dependencies
  * [nerves_system_br v1.10.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.10.2)
  * Erlang 22.2.4

## v1.10.1

* Enhancements
  * Set `expand=true` on the application data partition. This will only take
    effect for users running the complete task, fwup will not expand application
    data partitions that exist during upgrade tasks.

* Updated dependencies
  * [nerves_system_br v1.10.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.10.1)
  * Erlang 22.2.3

## v1.10.0

This release updates Buildroot to 2019.11 with security and bug fix updates
across Linux packages. Enables dnsd, udhcpd and ifconfig in the default
Busybox configuration to support `vintage_net` and `vintage_net_wizard`.
See the `nerves_system_br` notes for details.

* Updated dependencies
  * [nerves_system_br v1.10.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.10.0)
  * Erlang 22.1.8

## v1.9.2

This release updates Buildroot to 2019.08.2 with security and bug fix updates
across Linux packages. See the `nerves_system_br` notes for details.
Erlang/OTP is now at 22.1.7.

* Updated dependencies
  * [nerves_system_br v1.9.5](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.9.5)

## v1.9.1

This release pulls in security and bug fix updates from `nerves_system_br`.
Erlang/OTP is now at 22.1.1.

IMPORTANT: The IEx prompt was being output on the UART. This was inconsistent
with other Nerves/Raspberry Pi systems and has been fixed. If you want to
use the UART, you'll need to override the `erlinit.config` file.

* Bug fixes
  * Default to displaying the iex prompt on the HDMI port like the other
    Raspberry Pi systems
  * Compile in the I2C drivers so they're available early on for NervesKey and
    other use at initialization

* Updated dependencies
  * [nerves_system_br v1.9.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.9.4)
  * linux - update to the raspberrypi-kernel_1.20190925-1 tag

## v1.9.0

NOTE: bootcode.bin is not used by the RPi 4 and is no longer built.
  If updating a fork of this project, be sure to remove references to it from
  your fwup.conf. See
  https://www.raspberrypi.org/documentation/hardware/raspberrypi/booteeprom.md

This release updates Buildroot to 2019.08 with security and bug fix updates
across Linux packages. See the `nerves_system_br` notes for details.

* Updated dependencies
  * [nerves_system_br v1.9.2](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.9.2)

* Enhancements
  * Support a variety of USB->UART adapters so more devices work out-of-the-box

## v1.8.2

This release fixes an issue that broke display output on small LCD screens.
Updating the Raspberry Pi firmware to the latest from the Raspberry Pi
Foundation fixed the issue. See
https://github.com/fhunleth/rpi_fb_capture/issues/2 for details.

* Updated dependencies
  * [nerves_system_br v1.8.5](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.8.5)

## v1.8.1

This is the initial Nerves System release for the Raspberry Pi 4. It's version
corresponds to other Nerves System releases for Raspberry Pi's for ease of
referring to version numbers.

While similar looking, the Raspberry Pi 4 has some significant differences with
other Raspberry Pis. The following functionality appears to work so far:

1. Support for up to 4 GB of DRAM (1 GB and 2 GB versions supported too)
2. I2C, SPI, and GPIO - The RPi 4 has additional pin mux options. They have not
   been tested.
3. The primary UART has not been redirected away from the Bluetooth module. This
   is useful for using BLE with the Harald library, but is different from the
   other RPi defaults
4. The Pi Camera and Raspberry Pi Foundation 7" Touchscreen both work
5. Gigabit Ethernet works
6. WiFi appears to work
7. USB 3 devices

The following major features have not been tested:

1. OpenGL support and HDMI output
2. USB Gadget mode via the USB C connector (the gadget drivers are currently
   enabled, though)

Additionally, the Raspberry Pi 4 port uses 32-bit mode on the ARM even though
the processor supports 64-bit usage. 64-bit usage didn't build when tried and
the Raspberry Pi Foundation promotes 32-bit usage so that's what's used here.

* Primary constituent project versions
  * Erlang 22.0.7
  * [nerves_system_br v1.8.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.8.4)
  * [nerves_toolchain_arm_unknown_linux_gnueabihf v1.2.0](https://github.com/nerves-project/toolchains/releases/tag/v1.2.0)

