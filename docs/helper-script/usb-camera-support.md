---
hide:
  - toc
---
This allows to use third-party camera from your printer's USB port.

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Install Helper Script</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `USB Camera Support`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">

- If you use **Fluidd** as the Web Interface, camera will be accessible with (replacing xxx.xxx.xxx.xxx by your local IP address):<br />
    `http://xxx.xxx.xxx.xxx:4408/webcam/?action=stream` for first Camera URL Stream<br />
    `http://xxx.xxx.xxx.xxx:4408/webcam/?action=snapshot` for first camera URL snapshot<br />
    `http://xxx.xxx.xxx.xxx:4408/webcam2/?action=stream` for second Camera URL Stream<br />
    `http://xxx.xxx.xxx.xxx:4408/webcam2/?action=snapshot` for second Camera URL Snapshot

- If you use **Mainsail** as the Web Interface, camera will be accessible with (replacing xxx.xxx.xxx.xxx by your local IP address):<br />
    `http://xxx.xxx.xxx.xxx:4409/webcam/?action=stream` for first Camera URL Stream<br />
    `http://xxx.xxx.xxx.xxx:4409/webcam/?action=snapshot` for first Camera URL Snapshot<br />
    `http://xxx.xxx.xxx.xxx:4409/webcam2/?action=stream` for second Camera URL Stream<br />
    `http://xxx.xxx.xxx.xxx:4409/webcam2/?action=snapshot` for second Camera URL Snapshot

<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
