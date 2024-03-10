This allows to backup and restore Moonraker database. This can be useful for keeping print statistics after a printer reset.


## Backup
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Backup & Restore] Menu` by typing ++"4"++ , validate with ++"Enter"++ and select `Backup Moonraker database`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Backup_Restore_Menu.png">

- When it's done, a compressed file named `backup_database.tar.gz` containing the backup is created in `/usr/data/printer_data/config/` folder accessible from Fluidd or Mainsail Web interface and it can be downloaded (right click on the file and _Download_):

    - On original Fluidd Web Interface go to `Configuration` icon on the left side.
    - On original Mainsail Web Interface go to `Machine` tab on the left side.


## Restore
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- Make sure `backup_database.tar.gz` file is present in `/usr/data/printer_data/config/` folder.

- In the script, enter in `[Backup & Restore] Menu` by typing ++"4"++ , validate with ++"Enter"++ and select `Restore KMoonraker database`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Backup_Restore_Menu.png">

- When it's done, Moonraker database is restored.

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
