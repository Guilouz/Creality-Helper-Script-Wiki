GuppyFLO is a self-hosted service that enables local/remote management of multiple Klipper printers using Moonraker.

More info about GuppyFLO: :material-github: [Here](https://github.com/ballaswag/guppyflo)

More info about Tailscale: :material-web: [Here](https://tailscale.com/)

!!! Note
    **This procedure must be repeated after restoring the printer to factory settings.**


## Installation
<hr>

- Make sure you have followed this <a href="../../helper-script/helper-script-installation">Helper Script Installation</a> section before.

- In the script, enter in `[Install] Menu` by typing ++"1"++ , validate with ++"Enter"++ and install `GuppyFLO`:

    <img width="900" src="../../assets/img/Creality-Helper-Script/Install_Menu.png">


## Prerequisites
<hr>

- Create a free Tailscale account here: :material-web: [Create Tailscale Account](https://login.tailscale.com/start)
 
- Install Tailscale application depending device(s) you want to use for remote access:
    :material-web: [Download Tailscale App](https://tailscale.com/download)


## Configurations
<hr>

- Open your web browser and go to the address `http://xxx.xxx.xxx.xxx:9873` (by replacing **xxx.xxx.xxx.xxx** by your printer's local IP address) to access the GuppyFLO Web interface :

    <img width="900" src="../../assets/img/GuppyFLO/01.png">

- Then, click on authenticate link to register GuppyFLO instance to Tailscale:

    <img width="900" src="../../assets/img/GuppyFLO/02.png">

- You will be redirected to the Tailscale website to connect device by clicking on `Connect` button:

    <img width="500" src="../../assets/img/GuppyFLO/03.png">

- Go to to your Tailscale Admin console here: :material-web: [Tailscale Admin Console](https://login.tailscale.com/admin/machines)

- There you will see the connected devices and their respective IP addresses:

    1. guppyflo :fontawesome-solid-arrow-right-long: Your printer
    2. IP address assigned to your printer
    3. The devices you have connected to Tailscale (here my mobile phone)
    4. The IP addresses assigned to the devices you have connected

    <img width="900" src="../../assets/img/GuppyFLO/06.png">

- Go to Tailscale DNS settings tab and enable `MagicDNS` feature:

    <img width="900" src="../../assets/img/GuppyFLO/07.png">

- Go back to GuppyFLO Web interface and click on `Add Printer` button:

    <img width="900" src="../../assets/img/GuppyFLO/04.png">

- Configure settings and click on `Save` button:

    <img width="900" src="../../assets/img/GuppyFLO/05.png">

- To add camera on GuppyFLO Web interface, click on `Auto Detect` button:

    <img width="900" src="../../assets/img/GuppyFLO/09.png">

- You can delete one of the two camera configurations and clic on `Save` button:

    <img width="900" src="../../assets/img/GuppyFLO/11.png">

- You can now connect to GuppyFlo Web interface remotely with <a href="http://guppyflo">http://guppyflo</a> URL:

    <img width="350" src="../../assets/img/GuppyFLO/08.png">

- If you have configured camera, you have also access to your camera by clicking on `Cameras` button:

    <img width="350" src="../../assets/img/GuppyFLO/10.png">

- You can also configure Mobileraker App for remote access, see <a href="../mobileraker-companion/#add-printer-remote-access-with-guppyflo">here</a>.

!!! Note
    **For now camera not working remotely on Fluidd or Mainsail Web interface and it will be fixed in future release of GuppyFLO.**


<br />

**If you like my work, don't hesitate to support me by paying me a 🍺 or a ☕. Thank you 🙂**

<a href="https://ko-fi.com/guilouz" target="_blank"><img width="350" src="../../assets/img/home/Ko-fi.png"></a>
