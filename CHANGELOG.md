# Changelog

## v1.17.1

This is a security/bug fix patch release. It should be safe to update for
everyone.

* Updated dependencies
  * [nerves_system_br v1.17.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.17.1)
  * [Buildroot 2021.08.1](http://lists.busybox.net/pipermail/buildroot/2021-October/625642.html)
  * [Erlang/OTP 24.1.2](https://erlang.org/download/OTP-24.1.2.README)

* Fixes
  * Fix the sysfs thermal interface driver. It was incorrectly unselected in the
    Linux kernel options previously.

* Improvements
  * Include software versioning and licensing info (see legal-info directory in
    artifact)

## v1.17.0

This release updates to Buildroot 2021.08 and OTP 24.1. If you have made a
custom system off this one, please review the `nerves_system_br v1.17.0` release
notes.

* Updated dependencies
  * [nerves_system_br v1.17.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.17.0)
  * [Buildroot 2021.08](http://lists.busybox.net/pipermail/buildroot/2021-September/622072.html)
  * [Erlang/OTP 24.1](https://erlang.org/download/OTP-24.1.README)

## v1.16.3

* Improvements
  * Enable USB gadget interface on boot so that the USB-C cable can provide
    power and networking like the RPi Zero and RPi 3A.

## v1.16.2

This release updates Erlang/OTP from 24.0.3 to 24.0.5 and Buildroot from 2021.05
to 2021.05.1. Both of these are security/bug fix updates. This is expected to be
a safe upgrade from v1.16.1 for all users.

* Updated dependencies
  * [nerves_system_br v1.16.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.16.1)
  * [Erlang/OTP 24.0.5](https://erlang.org/download/OTP-24.0.5.README)

* Improvements
  * Beta support for using a `runtime.exs` script for runtime configuration.
  * Added a `provision` task to the `fwup.config` to enable re-provisioning a
    MicroSD card without changing its contents.
  * Adds a default `/etc/sysctl.conf` that enables use of ICMP in Erlang. This
    requires `nerves_runtime v0.11.5` or later to automatically load the sysctl
    variables. With it using `:gen_udp` to send/receive ICMP will "just work".
    It also makes it easier to add other sysctl variables if needed.

## v1.16.1

This release updates Nerves Toolchains to v1.4.3 and OTP 24.0.3. It should be safe for everyone to apply.

* Updated dependencies
  * [nerves_system_br v1.16.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.16.1)
  * [Erlang/OTP 24.0.3](https://erlang.org/download/OTP-24.0.3.README)
  * [nerves toolchains v1.4.3](https://github.com/nerves-project/toolchains/releases/tag/v1.4.3)

## v1.16.0

This release updates to Buildroot 2021.05 and OTP 24.0.2. If you have made a
custom system off this one, please review the `nerves_system_br v1.16.0` release
notes.

* Updated dependencies
  * [nerves_system_br v1.16.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.16.0)
  * [Buildroot 2021.05](http://lists.busybox.net/pipermail/buildroot/2021-June/311946.html)
  * [Erlang/OTP 24.0.2](https://erlang.org/download/OTP-24.0.2.README)

* Improvements
  * This release now contains debug symbols and includes the Build-ID in the
    ELF headers. This makes it easier to get stack traces from C programs. As
    before, the Nerves tooling strips all symbols from firmware images, so this
    won't make programs bigger.
  * Enable compile-time `wpa_supplicant` options to support WPA3, mesh
    networking, WPS and autoscan.

## v1.15.1

This is a security/bug fix release that updates to Buildroot 2021.02.1 and OTP
23.3.1. It should be safe for everyone to apply.

* Improvements
  * Raspberry Pi CM4 support
  * espeak has been removed from the default install to trim 13 MB off the root
    filesystem

* Updated dependencies
  * Linux 5.4.83 - required for CM4 device tree updates
  * [nerves_system_br v1.15.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.15.1)
  * [Buildroot 2021.02](http://lists.busybox.net/pipermail/buildroot/2021-April/307970.html)
  * [Erlang/OTP 23.3.1](https://erlang.org/download/OTP-23.3.1.README)

## v1.15.0

This release updates to Buildroot 2021.02 and OTP 23.2.7. If you have made a
custom system off this one, please review the `nerves_system_br v1.15.0` release
notes.

The Nerves toolchain has also been updated to v1.4.2. This brings in Linux 4.14
headers to enable use of cdev and eBPF. This won't affect most users.

* Updated dependencies
  * [nerves_system_br v1.15.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.15.0)
  * [Buildroot 2021.02](http://lists.busybox.net/pipermail/buildroot/2021-March/305168.html)
  * [Erlang/OTP 23.2.7](https://erlang.org/download/OTP-23.2.7.README)
  * [nerves toolchains v1.4.2](https://github.com/nerves-project/toolchains/releases/tag/v1.4.2)

## v1.14.0

This release updates to Buildroot 2020.11.2, GCC 10.2 and OTP 23.2.4.

When migrating custom systems based, please be aware of the following important
changes:

* There's a new `getrandom` syscall that is made early in BEAM startup. This has
  the potential to block the BEAM before Nerves can start `rngd` to provide
  entropy. We have not seen this issue here, but have updated `erlinit.config`
  for the time being as a precaution.
* The GCC 10.2.0 toolchain has a different name that calls out "nerves" as the
  vendor and the naming is now more consistent with other toolchain providers.
* Experimental support for tooling that requires more information about the
  target has been added. The initial support focuses on zigler.

* Updated dependencies
  * [nerves_system_br: bump to v1.14.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.14.4)
  * [Buildroot 2020.11.2](http://lists.busybox.net/pipermail/buildroot/2021-January/302574.html)
  * [Erlang/OTP 23.2.4](https://erlang.org/download/OTP-23.2.4.README)
  * [Nerves toolchains 1.4.1](https://github.com/nerves-project/toolchains/releases/tag/v1.4.1)

## v1.13.5

This release adds missing V3D/VC4 drivers and enables the `vc4-fkms-v3d` device
tree overlay. This fixes issues found when trying out OpenGLES w/ DRM.

## v1.13.3

This releases enables the OpenGL ES drivers so that it's possible to run UI
libraries without a custom system. Note that the RPi4 uses the Linux DRM
interface rather than MMAL and so it is not compatible with Elixir UI libraries
that work on other Raspberry Pis.

* Updated dependencies
  * [nerves_system_br: bump to v1.13.7](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.13.7)
  * [Erlang/OTP 23.1.5](https://erlang.org/download/OTP-23.1.5.README)

## v1.13.2

This release fixes the following issues found with the switch to 64-bit ARM:

* Circuits.GPIO can't set pullups
* 5 GHz WiFi is either flaky or doesn't work
* No GPU drivers

A huge thanks for people in the Nerves community that identified these issues
and helped verify the fixes.

This release also includes a patch release update to [Buildroot
2020.08.2](http://lists.busybox.net/pipermail/buildroot/2020-November/296830.html).

* Updated dependencies
  * [nerves_system_br: bump to v1.13.5](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.13.5)
  * [erlinit 1.9.0](https://github.com/nerves-project/erlinit/releases/tag/v1.9.0)

## v1.13.1

IMPORTANT: This release runs the RPi4 in 64-bit ARM mode. This change was made
for many reasons. See
https://github.com/nerves-project/nerves_system_rpi4/issues/65 for details.
While this is a big change, it is likely that it will not affect your programs
at all.

The second change in this release is to bump the Linux kernel to 5.4. This
follows the kernel update in the Raspberry Pi OS.

If you have based a custom system off of this one, please inspect all
configuration files for changes. In particular, WiFi firmware location has
changed since the `rpi-wifi-firmware` package went out of date. Git commit
messages on the `nerves_system_rpi4` repository may also be helpful.

* Updated dependencies
  * [nerves_system_br: bump to v1.13.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.13.4)
  * [Erlang/OTP 23.1.4](https://erlang.org/download/OTP-23.1.4.README)
  * [boardid 1.10.0](https://github.com/nerves-project/boardid/releases/tag/v1.10.0)

* Improvements
  * Enabled reproducible builds in Buildroot to remove some timestamp and build
    path differences in firmware images. This helps delta firmware updates.
  * The memory cgroup controller is no longer enabled by default. This was an
    upstream change. As a result, the memory cgroup directory is no longer
    mounted.

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

