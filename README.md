# TI AM62X aka AM62XX-EVM

**This is a work in progress.**

This is the base Nerves System configuration for the [TI AM62X](#sk-am62).

![AM62X](assets/images/am62xx-evm.png)
<br><sup>[Image credit](#ti)</sup>

| Feature        | Description                                                 |
| -------------- | ----------------------------------------------------------- |
| CPU            | 1.4 GHz quad-core Cortex-A53 (64-bit mode)                  |
| Memory         | 2 GB DDR4                                                   |
| Storage        | MicroSD and eMMC                                            |
| Linux kernel   | 6.1                                                         |
| IEx terminal   | UART `ttyS2`                                                |
| GPIO, I2C, SPI | Yes - [Elixir Circuits](https://github.com/elixir-circuits) |
| Display        | Yes, but not supported yet                                  |
| ADC            | No                                                          |
| Ethernet       | Yes                                                         |
| WiFi           | Yes                                                         |
| Bluetooth      | Yes                                                         |
| RTC            | No                                                          |
| HW Watchdog    | Yes                                                         |

[Image credit](#sk-am62): This image is from [ti.com](https://www.ti.com/tool/SK-AM62).

## Dev Kits

| Model | Status |
| ----- | ------ |
| [SK-AM62](https://www.ti.com/tool/SK-AM62) | Not supported |
| [SK-AM62B](https://www.ti.com/tool/SK-AM62B) | Not supported |
| [SK-AM62-LP](https://www.ti.com/tool/SK-AM62-LP) | Not supported |
| [SK-AM62B-P1](https://www.ti.com/tool/SK-AM62B-P1) | In progress |
| [SK-AM62-SIP](https://www.ti.com/tool/SK-AM62-SIP) | Pending |
