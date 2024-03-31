---
hide:
  - toc
---
#### 31/03/2024

  - Updated script to 5.3.0 to add support for `SimplyPrint`. See new section on wiki [here](helper-script/simplyprint.md).
  
#### 30/03/2024

  - Updated script to 5.2.0 to add support for `OctoApp Companion` (Thanks to [crysxd](https://github.com/crysxd)). See new section on wiki [here](helper-script/octoapp-companion.md).

#### 27/03/2024

- Updated [GuppyFLO](helper-script/guppyflo.md) section to add configuration for camera.

#### 23/03/2024

  - Updated script to 5.1.0 to add support for `GuppyFLO`. See new section on wiki [here](helper-script/guppyflo.md).

#### 21/03/2024

  - Updated Wiki with new 1.3.3.8 Creality firmware.

#### 11/03/2024

  - Updated script to 5.0.1 to fix Mainsail on port 80 when removing Creality Web Interface.

#### 10/03/2024

!!! Warning
    **Due to many changes in files, it's necessary to reset factory settings before using script!**

  - New Wiki.
  - New script version 5.0.0:
    * Ended support for old firmwares (only support 1.3.3.5 and above for K1 Series and 1.1.0.12 and above for KE Series).
    * Added support for Creality KE printers (for compatible features).
    * Code completely rewritten.
    * Now installed in /usr/data/helper-script and it completely offline (except for downloading official builds).
    * Updates can be done when the script is started or from the Update Manager on Web interfaces.
    * All files are symbolic links, allowing you to always have the latest versions if they are updated after a script update.
    * `Supervisor Lite` and `Host Control Support` are now installed with Moonraker.
    * Fixed loops in `WARMUP` macro when installing `Useful Macros`.
    * Added support for `Klipper Virtual Pins`. This allows usage of virtual (simulated) pins in Klipper configurations.
    * Added support for `Git Backup`. This allows to watch Klipper configuration folder and automatically backup to GitHub whenever a change is made in that directory.
    * Added support for new `Mobileraker Companion` installation and can be updated from Update Manager.
    * Added `M600 Support`. This allows to use M600 command in your slicer to change filament.
    * Added possibility to Backup & Restore Moonraker database in `[Backup & Restore] Menu`.
    * Added `Fix Printing Gcode files from Folder` in `[Tools] Menu`.
    * Added possibility to update Entware packages in `[Tools] Menu`.
    * Added possibility to enable Camera settings in Moonraker in `[Tools] Menu`.
    * Added possibility to backup and restore Klipper configuration files and Moonraker database with macros when installing `Useful Macros`.
    * Added possibility to Reset Factory Settings directly from the script in `[Tools] Menu`. Reset from WebSocket connection with html file is not needed anymore.
  - KAMP is now integrated in Helper Script (repo has been removed) with this changes:
    * Removed not used settings.
    * Removed blob purge and replaced by classic line purge when KAMP purge is not possible.
    * Improved `START_PRINT` macro, you can now disable KAMP with `KAMP` button on Web interfaces.<br>
      When KAMP is enabled: A bed mesh named "kamp" is created and loaded to use adaptative bed mesh.<br>
      When KAMP is disabled: A bed mesh named "default" is created and loaded to use classic calibration (full bed mesh), you can also disable bed leveling before print with `BED_LEVELING` button on Web interfaces (it have no effect when KAMP is enabled).

<br />
