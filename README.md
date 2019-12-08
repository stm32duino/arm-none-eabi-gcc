# The GNU Arm Embedded Toolchain binaries used by the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32) support for Arduino

---

# Important note
**_8.2.1-1.7_ is the latest release of this GitHub repository.**

The [GNU MCU Eclipse ARM Embedded GCC](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc) was rebranded as [The xPack GNU Arm Embedded GCC](https://xpack.github.io/arm-none-eabi-gcc/) and was migrated to the xPack project.

Releases are available here:

https://github.com/xpack-dev-tools/arm-none-eabi-gcc-xpack/releases

and are directly usable by the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32).

---

## Rationale

Provide GNU Arm Embedded Toolchain binaries required during the installation of the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32) support for Arduino which required 4 platforms.

Toolchain is automatically installed when the STM32 core is installed thanks the [Arduino Boards Manager](https://www.arduino.cc/en/guide/cores) --> See [stm32 core installation](https://github.com/stm32duino/wiki/wiki/Getting-Started#installing-stm32-cores) wiki page.

This is **not** a new GCC toolchain distribution for ARM devices. 
Official [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/gnu-toolchain/gnu-rm) distribution, by ARM.

## Changes

Compared to the original ARM release, there are no functional changes. The **same architecture options** are supported and **the same 
combinations of libraries** (derived from newlib) are provided.

Up to release **8-2018-q4-major**, toolchains was built and packaged by stm32duino GitHub organization members. Now, packages are based on [GNU MCU Eclipse ARM Embedded GCC](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc) releases. All required platforms (Windows, Linux and MacOS) are provided, they are only repackaged to fit Arduino requirements (root path and folder name changed, no modified files).

## Releases

A release is done when an update of the **GNU Arm Embedded Toolchain** is required for the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32) support for Arduino.
It generally use the latest official [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/gnu-toolchain/gnu-rm) 
releases, maintained by ARM.

### 8.2.1-1.7 ([GNU MCU Eclipse ARM Embedded GCC v8.2.1-1.7 20190524](https://github.com/gnu-mcu-eclipse/arm-none-eabi-gcc/releases/tag/v8.2.1-1.7) version)
This release is functionally equivalent to **8-2018-q4-major** from December 20, 2018,
and is based on `gcc-arm-none-eabi-8-2018-q4-major-src.tar.bz2`, but fixes the bugs present in the initial ARM release.

### 8-2018-q4-major
This release is equivalent to **8-2018-q4-major** from December 20, 2018,
and is based on the `gcc-arm-none-eabi-8-2018-q4-major-src.tar.bz2` source invariant except following patches were applied in:
 * gcc to fix the Windows LTO with -g [88422](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=88422)
 * binutils to fix the 32-bit objcopy [24065](https://sourceware.org/bugzilla/show_bug.cgi?id=24065)
 * gcc to fix Windows paths with spaces and LTO [89249](https://gcc.gnu.org/bugzilla/show_bug.cgi?id=89249)

This release has an issue with the linker under Windows if paths contains spaces. See #1.

### 7-2018-q2-update

This release is equivalent to **7-2018-q2-update** from June 27, 2018,
and is based on `gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2`.

### 6-2017-q2-update

This release is equivalent to **6-2017-q2-update** from June 28, 2017,
and is based on `gcc-arm-none-eabi-6-2017-q2-update-src.tar.bz2`.

### 6-2017-q1-update

This release is equivalent to **6-2017-q1-update** from February 23, 2017,
and is based on `gcc-arm-none-eabi-6-2017-q1-update-src.tar.bz2`.
