Dell precision 5490 and Ell WD22TB Thunderbolt Docking Station laptop wont wake up on CTRL + ALT + DELETE  

BIOS: 1.15.0, 1.15.0

## Laptop

**Information**

|                  |                  |
| ---------------: | :--------------- |
|        **Model** | `Precision 5490` |
| **Manufacturer** | `Dell Inc.`      |
|  **Service Tag** | `25ZTJ34`        |
| **BIOS Version** | `1.15.0`         |

```powershell
# Get the system model and manufacturer
$computerSystem = Get-CimInstance -ClassName Win32_ComputerSystem

# Get the BIOS version and manufacturer
$bios = Get-CimInstance -ClassName Win32_BIOS

# Get the system enclosure information, which often contains the service tag
$chassis = Get-CimInstance -ClassName Win32_SystemEnclosure

Write-Host "|||"
Write-Host "|--:|:--|"
Write-Host "|**Model**| ``$($computerSystem.Model)``|"
Write-Host "|**Manufacturer**| ``$($computerSystem.Manufacturer)``|"
Write-Host "|**Service Tag**| ``$($chassis.SerialNumber)``|"
Write-Host "|**BIOS Version**| ``$($bios.SMBIOSBIOSVersion)``|"
```

## Docking Station
|                            |                                 |
| -------------------------: | :------------------------------ |
|           **Product Name** | [Dell Thunderbolt Dock WD22TB4] |
|          **Model Numbers** | `WD22TB4, K20A`                 |
|  **Service Tag (SVC TAG)** | `HXMVKT3UK`                     |
|   **Express Service Code** | `39039108375`                   |
|                   **PPID** | `VN-0MT6V9-CMV00-3BB-07DA-A01`  |
|            **MAC Address** | `AC-1A-3D-61-3F-63`             |
|            **Input Power** | `19.5V, 9.23A`                  |
| **Manufacturing Location** | `Made in Vietnam`               |

## Updating
1. Dell Command Update
2. Dell Support Assistant (Run as Administrator)

Both of these will do a [Dell Bios Updated] if available

### Historical Update
**Source**: [Thunderbolt Dock Drivers]

| Step  | Link                                                   | File Name                                                                       |
| :---- | :----------------------------------------------------- | :------------------------------------------------------------------------------ |
| **1** | [Realtek USB GBE Ethernet Controller Driver]           | `Realtek-USB-GBE-Ethernet-Controller-Driver_4X2V8_WIN_2.45.2020.214_A00_03.EXE` |
| **2** | [Realtek USB GBE Ethernet Controller Firmware Utility] | `24314_DellFW_UPGRADE_DOCK_UTILITY_v1.2.exe`                                    |

<!-- Thunderbolt Update -->
[Thunderbolt Dock Drivers]: https://www.dell.com/support/product-details/en-us/servicetag/0-SFFKVXAvYnQreGswVWNjT2pJazE0Zz090/drivers
[Realtek USB GBE Ethernet Controller Driver]: https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=4x2v8
[Realtek USB GBE Ethernet Controller Firmware Utility]: https://www.dell.com/support/product-details/en-us/servicetag/0-SFFKVXAvYnQreGswVWNjT2pJazE0Zz090/drivers#:~:text=Download-,Realtek%20USB%20GBE%20Ethernet%20Controller%20Firmware%20Utility,-Recommended


[Dell Bios Updated]: https://www.dell.com/support/kbdoc/en-us/000124211/dell-bios-updates
[Dell Thunderbolt Dock WD22TB4]: https://www.dell.com/support/home/en-us/drivers/driversdetails?driverid=w5jt8