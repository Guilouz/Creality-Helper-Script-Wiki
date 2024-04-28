You can easily restore current Firmware to a previous Firmware directly from the Helper Script.

## Download Links
<hr>

!!! Note
    Firmwares are official from Creality.<br />You can also download them from :material-web: [Creality Cloud](https://www.crealitycloud.com/software-firmware/firmware/ender-series).

&nbsp;&nbsp;&nbsp;&nbsp;:material-google-drive: [1.2.0.46 (Google Drive)](https://drive.google.com/file/d/1ECPGartjdiBhqMHSAjWLiDUkL3k6Dw7a/view?usp=drive_link) / :material-note-text: [Changelog](https://raw.githubusercontent.com/Guilouz/Creality-Helper-Script-Wiki/main/downloads/Changelogs/Ender-3V3/Changelog_1.2.0.46.txt)

&nbsp;&nbsp;&nbsp;&nbsp;:material-google-drive: [1.2.1.0 (Google Drive)](https://drive.google.com/file/d/1SecWCqGkot1u1UBs3mxze3UE2_emKb6-/view?usp=drive_link) / :material-note-text: [Changelog](https://raw.githubusercontent.com/Guilouz/Creality-Helper-Script-Wiki/main/downloads/Changelogs/Ender-3V3/Changelog_1.2.1.0.txt)

&nbsp;&nbsp;&nbsp;&nbsp;:material-google-drive: [1.2.1.3 (Google Drive)](https://drive.google.com/file/d/1WgASL64AKSqmyqxzyhYDyrflWLY9LVa6/view?usp=drive_link) / :material-note-text: [Changelog](https://raw.githubusercontent.com/Guilouz/Creality-Helper-Script-Wiki/main/downloads/Changelogs/Ender-3V3/Changelog_1.2.1.3.txt)


## Prepare USB drive
<hr>

- Insert USB drive in your computer.

- You need to format it in FAT32 with 4096 allocation size (or exFAT on some USB drives).

- Copy `.img` firmware file you want to restore to the root of your USB drive and remove it from your computer.

    !!! Warning
        **Make sure there is no other file present on the USB drive except the firmware file.**


## Restoration
<hr>

- Turn on the printer.

- When you are on home screen, plug USB drive on the front of the printer.

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- Start Helper Script and enter in `[Tools] Menu` by typing ++"5"++ , validate with ++"Enter"++ and select `Restore a previous firmware`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Tools_Menu.png">

- Then confirm the restoration.

- You should see the progress status in the console.

- When the process is complete, just turn off the printer and turn it back on to boot into the new firmware.

- Then, follow this <a href="../../firmwares/reset-factory-settings">Reset Factory Settings</a> section to restore default settings.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
