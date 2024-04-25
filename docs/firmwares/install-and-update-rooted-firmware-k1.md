This guide explain how to install firmware and enable Root access.

## Prerequisites
<hr>

Please follow the instruction below strictly before to install latest firmware. Otherwise, installation of latest firmware may fail.

**For V1.2.9.14 and earlier firmwares:**<br />
→ Update to `V1.2.9.15` via USB Drive<br />
→ Update to `V1.2.9.22` via OTA/USB Drive<br />
→ Update to `V1.3.30` via OTA/USB Drive<br />
→ Update to `V1.3.1.4` via USB Drive or from Creality Cloud APP

**For V1.2.9.17 to 1.2.9.21 firmware:**<br />
→ Update to `V1.2.9.22` via OTA/USB Drive<br />
→ Update to `V1.3.30` via OTA/USB Drive<br />
→ Update to `V1.3.1.4` via USB Drive or from Creality Cloud APP

**For V1.3.0.30 firmware:**<br />
→ Update to `V1.3.1.4` via USB Drive or from Creality Cloud APP

**For V1.3.1.4 and above firmwares:**<br />
→ You can install latest firmwares below.

!!! Note
    You can find earlier firmwares download links here: :material-web: [Creality Cloud](https://www.crealitycloud.com/software-firmware/firmware/flagship-series).


## Download Links
<hr>

!!! Note
    Firmwares are official from Creality and work on K1, K1C and K1 Max, detection of the correct printer is done by the firmware.<br />You can also install them from OTA or download them from :material-web: [Creality Cloud](https://www.crealitycloud.com/software-firmware/firmware/flagship-series).

&nbsp;&nbsp;&nbsp;&nbsp;:material-google-drive: [1.3.3.5 (Google Drive)](https://drive.google.com/file/d/1T0TvtmtD22mEpzL5YJzbyJ7H-9QIoozB/view?usp=drive_link) / :material-note-text: [Changelog](https://raw.githubusercontent.com/Guilouz/Creality-Helper-Script-Wiki/main/downloads/Changelogs/K1/Changelog_1.3.3.5.txt) / :material-file-image: <a href="https://raw.githubusercontent.com/Guilouz/Creality-Helper-Script-Wiki/main/downloads/Changelogs/K1/Changelog_1.3.2.20.jpg">Picture</a>

&nbsp;&nbsp;&nbsp;&nbsp;:material-google-drive: [1.3.3.8 (Google Drive)](https://drive.google.com/file/d/1Kh8oaVWUtEd0saeWahEs4Y5dTcPnKPrV/view?usp=drive_link) / :material-note-text: [Changelog](https://raw.githubusercontent.com/Guilouz/Creality-Helper-Script-Wiki/main/downloads/Changelogs/K1/Changelog_1.3.3.8.txt)


## Installation & Update
<hr>

- Follow this <a href="../reset-factory-settings">Reset Factory Settings</a> section to restore default settings before Install/Update.

- When it's done, insert USB drive in your computer.

- You need to format it in FAT32 with 4096 allocation size (or exFAT on some USB drives).

- Copy `.img` firmware file to the root of your USB drive and remove it from your computer.

- Turn on the printer.

- When you are on home screen, plug USB drive on the front of the printer.

- A popup should appear indicating a new available update.

- Press `Upgrade` and wait during the update process.

- When it's done, the printer restarts.

- Once you are on the home screen, you can remove the USB drive.

- Perfom a new Self Check on the new firmware by going to `Settings` → `Self-check`.

    !!! Warning
        **After a factory reset, all features already been installed with <a href="../../helper-script/helper-script-installation">Creality Helper Script</a>  must be reinstalled.**


## Skip the Startup Self Check
<hr>

This can be useful if you have made modifications to the printer (BLTouch etc...) and you can no longer perform the Startup Self Check.

- Download and unzip this file: :material-download: [debugmode_JumpSelftest.zip](https://github.com/Guilouz/Creality-Helper-Script-Wiki/raw/main/downloads/debugmode_JumpSelftest.zip)

- Insert USB drive in your computer.

- Copy the `debugmode_JumpSelftest` file to the root of your USB drive and remove it from your computer.

- Plug USB drive on the front of the printer and turn it on.

- At startup, Self Check will be skipped.

- If you leave the USB drive inserted the Startup Self Check will still be ignored even after reboot.

- If you no longer want to have the USB drive inserted (until the next factory reset), connect to SSH (Guide is available <a href="../ssh-connection">here</a>) and enter this command:

    ``` title="SSH Command Prompt"
    sed -i 's/"self_test_sw":1/"self_test_sw":0/' /usr/data/creality/userdata/config/system_config.json
    ```


## Enable Root Access
<hr>

!!! Note
    **Root access must be re-enabled if you restore the printer to factory settings.**

- On the screen UI, go to `Settings` → `Root account information`:

    <img width="600" src="../../assets/img/Install-Rooted-Firmware/01.png">

- Carefully review the disclaimer, check the agreement box, wait 30 seconds and click on `OK` button:

    <img width="600" src="../../assets/img/Install-Rooted-Firmware/02.png">

- Root access is now enabled, you can click on `OK` button:

    <img width="600" src="../../assets/img/Install-Rooted-Firmware/03.png">

- You can now connect to SSH (Guide is available <a href="../ssh-connection">here</a>) with:
  
    * User: `root`
    * Password: `creality_2023`

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
