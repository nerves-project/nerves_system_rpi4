# Changelog

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

