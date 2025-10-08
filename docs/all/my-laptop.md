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
|           **Product Name** | `Dell Thunderbolt Dock WD22TB4` |
|          **Model Numbers** | `WD22TB4, K20A`                 |
|  **Service Tag (SVC TAG)** | `HXMVKT3UK`                     |
|   **Express Service Code** | `39039108375`                   |
|                   **PPID** | `VN-0MT6V9-CMV00-3BB-07DA-A01`  |
|            **MAC Address** | `AC-1A-3D-61-3F-63`             |
|            **Input Power** | `19.5V, 9.23A`                  |
| **Manufacturing Location** | `Made in Vietnam`               |
