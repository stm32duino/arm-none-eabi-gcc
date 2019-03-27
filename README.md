# The GNU Arm Embedded Toolchain binaries used by the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32) support for Arduino

## Rationale

Provide GNU Arm Embedded Toolchain binaries required during the installation of the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32) support for Arduino which required 4 platforms.

Toolchain is automatically installed when the STM32 core is installed thanks the [Arduino Boards Manager](https://www.arduino.cc/en/guide/cores) --> See [stm32 core installation](https://github.com/stm32duino/wiki/wiki/Getting-Started#installing-stm32-cores) wiki page.

This is **not** a new GCC toolchain distribution for ARM devices. 
Official [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/gnu-toolchain/gnu-rm) distribution, by ARM.

## Changes

Compared to the original ARM release, there are no changes. The **same architecture options** are supported and **the same 
combinations of libraries** (derived from newlib) are provided.


## Releases

A release is done when an update of the **GNU Arm Embedded Toolchain** is required for the [STM32 core](https://github.com/stm32duino/Arduino_Core_STM32) support for Arduino.
It generally use the latest official [GNU Arm Embedded Toolchain](https://developer.arm.com/tools-and-software/open-source-software/gnu-toolchain/gnu-rm) 
releases, maintained by ARM.

### 7-2018-q2-update

This release is equivalent to **7-2018-q2-update** from June 27, 2018,
and is based on `gcc-arm-none-eabi-7-2018-q2-update-src.tar.bz2`.

### 6-2017-q2-update

This release is equivalent to **6-2017-q2-update** from June 28, 2017,
and is based on `gcc-arm-none-eabi-6-2017-q2-update-src.tar.bz2`.

### 6-2017-q1-update

This release is equivalent to **6-2017-q1-update** from February 23, 2017,
and is based on `gcc-arm-none-eabi-6-2017-q1-update-src.tar.bz2`.
