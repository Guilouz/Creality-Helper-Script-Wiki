This allows to backup and restore Klipper configuration files (all files and folders stored in /usr/data/printer_data/config/ folder).


## Backup
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Backup & Restore] Menu` by typing ++"4"++ , validate with ++"Enter"++ and select `Backup Klipper configuration files`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Backup_Restore_Menu.png">

- When it's done, a compressed file named `backup_config.tar.gz` containing the backup is created in `/usr/data/printer_data/config/` folder accessible from Fluidd or Mainsail Web interface and it can be downloaded (right click on the file and _Download_):

    - On original Fluidd Web Interface go to `Configuration` icon on the left side.
    - On original Mainsail Web Interface go to `Machine` tab on the left side.

!!! Note
    You can also use `KLIPPER_BACKUP_CONFIG` macro to backup Klipper configuration files when installing <a href="../useful-macros.md">Useful Macros</a> feature.


## Restore
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- Make sure `backup_config.tar.gz` file is present in `/usr/data/printer_data/config/` folder.

- In the script, enter in `[Backup & Restore] Menu` by typing ++"4"++ , validate with ++"Enter"++ and select `Restore Klipper configuration files`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Backup_Restore_Menu.png">

- When it's done, `/usr/data/printer_data/config/` folder is restored.

!!! Note
    You can also use `KLIPPER_RESTORE_CONFIG` macro to restore Klipper configuration files when installing <a href="../useful-macros.md">Useful Macros</a> feature.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
