---
hide:
  - toc
---
This allows to install official and latest build of Fluidd.

Fluidd is a free and open-source Klipper web interface for managing your 3d printer.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `Updated Fluidd`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">

- Once is installed, to access to the original Fluidd Web Interface, just use your printer's IP address with port 4408 in your Web browser such as: `http://xxx.xxx.xxx.xxx:4408/` (replacing xxx.xxx.xxx.xxx by your local IP address).

    <img width="900" src="../../assets/img/Access-to-Web-Interface/Fluidd_Web_Interface.png">

    !!! Note
        You can update Fluidd with Update Manager when a new version is available.

- When configuring printer forwarding through a reverse proxy, remember to include your domain in the `moonraker.conf` file.

    ```ini
    [authorization]
    force_logins: False
    cors_domains:
        *.lan
        *.local
        *://localhost
        *://localhost:*
        *://my.mainsail.xyz
        *://app.fluidd.xyz
        *://<YOUR DOMAIN>
    ```

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
