You can easily restore current Firmware to a previous one.

## Download Links
<hr>

You can download firmware from :material-web: [Creality Cloud](https://www.crealitycloud.com/software-firmware/firmware/ender-series)


## Restoration
<hr>

!!! Note
    This can also be done from <a href="../../helper-script/helper-script-installation">Helper Script</a> in the `[Tools] Menu`.

- Insert USB drive in your computer.

- You need to format it in FAT32 with 4096 allocation size (or exFAT on some USB drives).

- Copy `.img` firmware file you want to restore to the root of your USB drive and remove it from your computer.

    !!! Warning
        **Make sure there is no other file present on the USB drive except the firmware file.**

- Turn on the printer.

- Once you are on home screen, plug USB drive on the front of the printer.

- Connect to SSH (Guide is available <a href="../ssh-connection">here</a>) and run this command:

    ```
    /etc/ota_bin/local_ota_update.sh /tmp/udisk/sda1/*.img
    ```

- You should see the progress status in the console.

- When the process is complete, just turn off the printer and turn it back on to boot into the new firmware.

- Then, follow this <a href="../reset-factory-settings">Reset Factory Settings</a> section to restore default settings.

    !!! Warning
        **After a factory reset, all features already been installed with <a href="../../helper-script/helper-script-installation">Helper Script for Creality</a>  must be reinstalled and root access needs to be re-enabled from screen settings.**

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
