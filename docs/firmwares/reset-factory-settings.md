The best way to reset the printer to its factory settings is to perform a full reset. There are 2 possibilities to do this.

Note that the Factory Reset function in the screen menu settings only performs a partial reset.


## Reset from SSH connection
<hr>

!!! Note
    This feature is only possible if you have installed <a href="../../helper-script/helper-script-installation">Helper Script</a>.

- Connect to SSH (Guide is available <a href="../../firmwares/ssh-connection">here</a>).

- Enter the following command to perform a full factory reset:

    ``` title="SSH Command Prompt"
    /etc/init.d/S58factoryreset reset
    ``` 

- Once executed, your printer will start with settings reset to default, only user preferences and connection settings are preserved.

- If needed, start a new calibration in `Settings` → `Self-check` on screen UI.

    !!! Warning
        **After a factory reset, all features already been installed with <a href="../../helper-script/helper-script-installation">Helper Script for Creality</a>  must be reinstalled.**


## Reset from USB drive
<hr>

This can be useful for factory resetting if you don't have SSH access or the printer is no longer connected to the network.

!!! Note
    This feature is only possible if you have installed <a href="../../helper-script/helper-script-installation">Helper Script</a>.

- Download and unzip this file: :material-download: [factory_reset.zip](https://github.com/Guilouz/Creality-Helper-Script-Wiki/raw/main/downloads/Files/factory_reset.zip)

- Insert USB drive in your computer.

- Copy the `factory_reset` file to the root of your USB drive and remove it from your computer.

- Plug USB drive on the front of the printer and turn it on.

- At startup, factory reset will be automatically executed, only user preferences and connection settings are preserved.

- If needed, start a new calibration in `Settings` → `Self-check` on screen UI.

    !!! Warning
        **After a factory reset, all features already been installed with <a href="../../helper-script/helper-script-installation">Helper Script for Creality</a>  must be reinstalled.**


## Reset from WebSocket connection
<hr>

!!! Warning
    **To reset to factory settings from WebSocket connection, Creality Web Server must be active.**<br />
      - Make sure the Creality Web Interface is restored if you have removed it with the Installation Helper Script.<br />
      - Make sure Guppy Screen is removed if you have installed it with the Installation Helper Script.

- Download and unzip this file: :material-download: [Creality_K1_Reset_Utility.zip](https://github.com/Guilouz/Creality-Helper-Script-Wiki/raw/main/downloads/Files/Creality_K1_Reset_Utility.zip)

- Open the file `Creality_K1_Reset_Utility.html` in your Internet browser:

  <img width="900" src="../../assets/img/Reset-Factory-Settings/Creality_K1_Reset_Utility.png">

- Make sure your printer is turned on and connected to your local network.

- Make sure the Creality Web Interface is restored if you have removed it with the Installation Helper Script.

- Make sure Guppy Screen is removed if you have installed it with the Installation Helper Script.

- Enter your printer's IP address and click the `Reset` button to restore your printer to factory settings.

- Your printer restart with the settings reset to default.

    !!! Warning
        **After a factory reset, all features already been installed with <a href="../../helper-script/helper-script-installation">Helper Script for Creality</a>  must be reinstalled and root access needs to be re-enabled from screen settings.**

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
