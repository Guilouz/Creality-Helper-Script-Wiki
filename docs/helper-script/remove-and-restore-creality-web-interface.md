This allows to remove Creality Web interface and replace it with Fluidd or Mainsail Web interface on port 80.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Remove Creality Web interface
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Customize] Menu` by typing ++"3"++ , validate with ++"Enter"++ and select `Remove Creality Web Interface`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Customize_Menu.png">

- The script detects whether Fluidd or Mainsail is installed and will override Creality's default interface.<br />
  If both Fluidd and Mainsail are installed, the script will ask you which Web interface you want to replace Creality's default interface.

- You will then be able to connect to:

    - Fluidd using the following URL: `http://xxx.xxx.xxx.xxx` by replacing **xxx.xxx.xxx.xxx** by your local IP address (`http://xxx.xxx.xxx.xxx:4408/` also remaining accessible) if you chose **Fluidd** as your default Web interface

    or

    - Mainsail using the following URL: `http://xxx.xxx.xxx.xxx` by replacing **xxx.xxx.xxx.xxx** by your local IP address (`http://xxx.xxx.xxx.xxx:4409/` also remaining accessible) if you chose **Mainsail** as your default Web interface


## Restore Creality Web interface
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Customize] Menu` by typing ++"3"++ , validate with ++"Enter"++ and select `Restore Creality Web Interface`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Customize_Menu.png">

- You will recover the classic use:

    - Creality Web interface accessible with the following URL: `http://xxx.xxx.xxx.xxx` by replacing **xxx.xxx.xxx.xxx** by your local IP address

    - Fluidd Web interface accessible with the following URL: `http://xxx.xxx.xxx.xxx:4408` by replacing **xxx.xxx.xxx.xxx** by your local IP address

    - Mainsail Web interface accessible with the following URL: `http://xxx.xxx.xxx.xxx:4409` by replacing **xxx.xxx.xxx.xxx** by your local IP address 

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
